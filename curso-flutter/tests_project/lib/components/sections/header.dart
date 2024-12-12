import 'package:flutter/material.dart';
import 'package:tests_project/data/bank_inherited.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.api,
  });

  final Future<String> api;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 103, 99, 234),
              Color.fromARGB(255, 155, 105, 254),
              Color.fromARGB(255, 195, 107, 255),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 88, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          text: '\$',
                          children: <TextSpan>[
                            TextSpan(
                                text: BankInherited.of(context)
                                    .values
                                    .available
                                    .toString(),
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                      ),
                      const Text('Available balance'),
                    ],
                  ),
                  FutureBuilder(
                      future: widget.api,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const CircularProgressIndicator();
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator();
                          case ConnectionState.active:
                            break;
                          case ConnectionState.done:
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text.rich(
                                  TextSpan(
                                    text: 'R\$',
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: snapshot.data.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge)
                                    ],
                                  ),
                                ),
                                const Text('Dolar to Real'),
                              ],
                            );
                        }
                        return const Text('Erro na API');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
