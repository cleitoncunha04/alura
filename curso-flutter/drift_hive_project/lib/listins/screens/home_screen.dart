import 'package:flutter/material.dart';
import 'package:flutter_listin/_core/data/cloud_data_handler.dart';
import 'package:flutter_listin/_core/helpers/confirmation_alert_dialog.dart';
import 'package:flutter_listin/authentication/models/mock_user.dart';
import 'package:flutter_listin/listins/data/database.dart';
import 'package:flutter_listin/listins/screens/widgets/home_drawer.dart';
import 'package:flutter_listin/listins/screens/widgets/home_listin_item.dart';
import '../models/listin.dart';
import 'widgets/listin_add_edit_modal.dart';
import 'widgets/listin_options_modal.dart';

class HomeScreen extends StatefulWidget {
  final MockUser user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Listin> listListins = [];

  late AppDatabase _appDatabase;

  @override
  void initState() {
    _appDatabase = AppDatabase();

    refresh();

    super.initState();
  }

  @override
  void dispose() {
    _appDatabase.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(user: widget.user),
      appBar: AppBar(
        title: const Text("Minhas listas"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value != null) {
                if (value.toString().contains('Cloud')) {
                  if (value == 'removeCloud') {
                    showConfrimationAlertDialog(
                      context,
                      title: 'Atenção!',
                      content: 'Deseja remover os dados armazenados na nuvem?',
                    ).then(
                      (isConfirm) => isConfirm
                          ? handleCloudActions(
                              option: value,
                              appDatabase: _appDatabase,
                            )
                          : null,
                    );

                    return;
                  } else {
                    handleCloudActions(
                      option: value,
                      appDatabase: _appDatabase,
                    );
                  }
                } else {
                  refresh(orderBy: value);
                }
              }
            },
            itemBuilder: (BuildContext ctx) {
              return [
                // Grupo: Nuvem
                const PopupMenuItem(
                  enabled: false,
                  child: Text(
                    'Nuvem',
                  ),
                ),
                const PopupMenuItem(
                  value: 'syncCloud',
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud_sync_rounded,
                    ),
                    title: Text(
                      'Sincronizar com a nuvem',
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'uploadCloud',
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud_upload_rounded,
                    ),
                    title: Text(
                      'Enviar para a nuvem',
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'removeCloud',
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud_off_rounded,
                    ),
                    title: Text(
                      'Remover dados da nuvem',
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: const PopupMenuDivider(),
                ), // Divisor entre os grupos
                // Grupo: Ordenação
                const PopupMenuItem(
                  enabled: false,
                  child: Text(
                    'Ordenação',
                  ),
                ),
                const PopupMenuItem(
                  value: 'name',
                  child: ListTile(
                    leading: Icon(
                      Icons.abc_rounded,
                    ),
                    title: Text(
                      'Ordernar por nome',
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'updateDate',
                  child: ListTile(
                    leading: Icon(
                      Icons.date_range_rounded,
                    ),
                    title: Text(
                      'Ordenar por data de modificação',
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'createDate',
                  child: ListTile(
                    leading: Icon(
                      Icons.date_range_outlined,
                    ),
                    title: Text(
                      'Ordenar por data de criação',
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddModal();
        },
        child: const Icon(Icons.add),
      ),
      body: (listListins.isEmpty)
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/bag.png"),
                  const SizedBox(height: 32),
                  const Text(
                    "Nenhuma lista ainda.\nVamos criar a primeira?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () {
                return refresh();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: TextField(
                          onChanged: (value) => refresh(search: value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: Text(
                              'Pesquise aqui...',
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          Listin listin = listListins[index];

                          return HomeListinItem(
                            listin: listin,
                            showOptionModal: showOptionModal,
                          );
                        },
                        childCount: listListins.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  showAddModal({Listin? listin}) {
    showAddEditListinModal(
      context: context,
      onRefresh: refresh,
      model: listin,
      appDatabase: _appDatabase,
    );
  }

  showOptionModal(Listin listin) {
    showListinOptionsModal(
      context: context,
      listin: listin,
      onRemove: remove,
    ).then((value) {
      if (value != null && value) {
        showAddModal(listin: listin);
      }
    });
  }

  refresh({String? orderBy, String? search}) async {
    // Basta alimentar essa variável com Listins que, quando o método for
    // chamado, a tela sera reconstruída com os itens.
    List<Listin> listaListins = await _appDatabase.findAll(orderBy: orderBy);

    if (search != null) {
      listaListins =
          listaListins.where((listin) => listin.name.contains(search)).toList();
    }

    setState(() {
      listListins = listaListins;
    });
  }

  void remove(Listin model) async {
    await _appDatabase.remove(int.parse(model.id));

    refresh();
  }

  void handleCloudActions({
    required String option,
    AppDatabase? appDatabase,
  }) async {
    CloudDataHandler cloudDataHandler = CloudDataHandler();

    cloudDataHandler
        .handleCloudActions(
      option: option,
      appDatabase: appDatabase,
    )
        .then((error) {
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            duration: const Duration(
              milliseconds: 1500,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.close,
                  color: Colors.white,
                )
              ],
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            duration: const Duration(
              milliseconds: 1500,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ação realizada com sucesso...',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.done,
                  color: Colors.white,
                )
              ],
            ),
          ),
        );
      }
    });

    // if (option != 'removeCloud') {
    //   await refresh();
    // }
  }
}
