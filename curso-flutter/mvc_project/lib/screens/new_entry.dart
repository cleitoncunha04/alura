import 'package:flutter/material.dart';
import 'package:mvc_project/controllers/book_controller.dart';
import 'package:mvc_project/models/google_book_model.dart';
import 'package:mvc_project/models/personal_book_model.dart';
import 'package:mvc_project/screens/components/entry.dart';
import 'components/date_input.dart';
import 'components/display_text.dart';
import 'components/primary_button.dart';
import '../theme.dart';

import 'home.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({
    super.key,
    required this.googleBook,
  });

  final GoogleBook googleBook;

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController initialDateController = TextEditingController();
  final TextEditingController finalDateController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final BookController _bookController = BookController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: DisplayText("Adicionando um Livro"),
                ),
                SizedBox(
                  width: 244,
                  child: Column(
                    children: <Widget>[
                      Entry(
                        googleBook: widget.googleBook,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Text(widget.googleBook.description),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: DateInput(
                                  textController: initialDateController,
                                  label: "Início da Leitura"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: DateInput(
                                  textController: finalDateController,
                                  label: "Final da Leitura"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: TextFormField(
                                controller: commentsController,
                                decoration: InputDecorationProperties
                                    .newInputDecoration(
                                  "",
                                  "Comentários",
                                ),
                                maxLines: 5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: PrimaryButton(
                                text: "Adicionar",
                                onTap: () {
                                  _bookController
                                      .save(
                                    book: PersonalBook(
                                      googleBook: widget.googleBook,
                                      dayStarted: initialDateController.text,
                                      dayFinished: finalDateController.text,
                                      comments: commentsController.text,
                                    ),
                                  )
                                      .then(
                                    (_) {
                                      if (context.mounted) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home()),
                                          (_) => false,
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
