import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/models/client.dart';
import 'package:provider_project/models/client_type.dart';
import 'package:provider_project/models/provider/client_types.dart';
import 'package:provider_project/models/provider/clients.dart';
import 'package:provider_project/models/provider/selected_client_type.dart';

import '../components/hamburger_menu.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key, required this.title});
  final String title;

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const HamburgerMenu(),
      body: Consumer<Clients>(
        builder: (BuildContext context, Clients clients, Widget? widget) {
          return ListView.builder(
            itemCount: clients.clients.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),
                child: ListTile(
                  leading: Icon(
                    clients.clients[index].type.icon,
                  ),
                  title: Text(
                      '${clients.clients[index].name} (${clients.clients[index].type.name})'),
                  iconColor: Colors.indigo,
                ),
                onDismissed: (direction) {
                  clients.removeAt(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
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
    TextEditingController emailInput = TextEditingController();

    ClientTypes clientTypesProvider =
        Provider.of<ClientTypes>(context, listen: false);

    Provider.of<SelectedClientType>(context, listen: false).selectedClientType =
        clientTypesProvider.clientTypes[0];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('Cadastrar cliente'),
            content: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    key: const Key('nameKey'),
                    controller: nomeInput,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      suffixIcon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  TextFormField(
                    key: const Key('emailKey'),
                    controller: emailInput,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  DropdownButton(
                    isExpanded: true,
                    value:
                        Provider.of<SelectedClientType>(context, listen: true)
                            .selectedClientType,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.indigo,
                    ),
                    onChanged: (newValue) {
                      Provider.of<SelectedClientType>(context, listen: false)
                          .choose(newValue as ClientType);
                    },
                    items:
                        clientTypesProvider.clientTypes.map((ClientType type) {
                      return DropdownMenuItem<ClientType>(
                        value: type,
                        child: Text(type.name),
                      );
                    }).toList(),
                  ),
                ],
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
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Consumer<Clients>(builder:
                  (BuildContext context, Clients clients, Widget? widget) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      clients.add(
                        Client(
                          name: nomeInput.text,
                          email: emailInput.text,
                          type: Provider.of<SelectedClientType>(context,
                                  listen: false)
                              .selectedClientType!,
                        ),
                      );

                      Navigator.pop(context);
                    },
                  ),
                );
              }),
            ],
          );
        });
  }
}
