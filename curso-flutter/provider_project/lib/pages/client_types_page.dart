import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/models/client_type.dart';
import 'package:provider_project/models/provider/client_types.dart';
import 'package:provider_project/models/provider/selected_icon.dart';

import '../components/hamburger_menu.dart';
import '../components/icon_picker.dart';

class ClientTypesPage extends StatefulWidget {
  const ClientTypesPage({super.key, required this.title});
  final String title;

  @override
  State<ClientTypesPage> createState() => _ClientTypesPageState();
}

class _ClientTypesPageState extends State<ClientTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const HamburgerMenu(),
      body: Consumer<ClientTypes>(
        builder: (BuildContext context, ClientTypes clientTypesProvider,
            Widget? widget) {
          return ListView.builder(
            itemCount: clientTypesProvider.clientTypes.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                child: ListTile(
                  leading: Icon(
                    clientTypesProvider.clientTypes[index].icon,
                  ),
                  title: Text(
                    clientTypesProvider.clientTypes[index].name,
                  ),
                  iconColor: Colors.deepOrange,
                ),
                onDismissed: (direction) {
                  clientTypesProvider.removeAt(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          createType(context);
        },
        tooltip: 'Add Tipo',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void createType(context) {
    TextEditingController nomeInput = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('Cadastrar tipo'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: nomeInput,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Provider.of<SelectedIcon>(context, listen: true)
                                    .selectedIcon !=
                                null
                            ? Icon(
                                Provider.of<SelectedIcon>(context,
                                        listen: false)
                                    .selectedIcon,
                                color: Colors.deepOrange)
                            : const Text('Selecione um ícone'),
                        const Padding(padding: EdgeInsets.all(5)),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.indigo,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.touch_app_sharp,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                final IconData? result = await showIconPicker(
                                    context: context,
                                    defalutIcon: Provider.of<SelectedIcon>(
                                            context,
                                            listen: false)
                                        .selectedIcon);

                                if (context.mounted) {
                                  Provider.of<SelectedIcon>(context,
                                          listen: false)
                                      .choose(result);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    Provider.of<SelectedIcon>(context, listen: false)
                        .choose(null);
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Provider.of<SelectedIcon>(context, listen: false)
                                .selectedIcon ==
                            null
                        ? Provider.of<SelectedIcon>(context, listen: false)
                            .choose(Icons.credit_score)
                        : null;

                    Provider.of<ClientTypes>(context, listen: false).add(
                      ClientType(
                        name: nomeInput.text,
                        icon: Provider.of<SelectedIcon>(context, listen: false)
                            .selectedIcon,
                      ),
                    );

                    Provider.of<SelectedIcon>(context, listen: false)
                        .choose(null);

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }
}
