import 'dart:io';

import 'package:api_project/helpers/logout.dart';
import 'package:api_project/helpers/weekday.dart';
import 'package:api_project/models/custom_snackbar_enum.dart';
import 'package:api_project/models/journal.dart';
import 'package:api_project/screens/common/custom_snackbar.dart';
import 'package:api_project/services/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final bool isEditing;

  AddJournalScreen({
    super.key,
    required this.journal,
    required this.isEditing,
  });

  final TextEditingController _contentController = TextEditingController();

  Future<bool> saveJournal(BuildContext context) async {
    SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    String? token = await asyncPrefs.getString('accessToken');

    String content = _contentController.text;

    JournalService journalService = JournalService();

    journal.content = content;

    try {
    return isEditing && token != null
        ? journalService.put(token, journal.id, journal)
        : journalService.post(token!, journal);
    } on TokenNotValidException {
      logout(context);
    } on HttpException catch (e) {
      showCustomSnackBar(
        context: context,
        type: CustomSnackBarTypes.error,
        content: '${e.message}...',
      );
    } on Exception catch (e) {
      showCustomSnackBar(
        context: context,
        type: CustomSnackBarTypes.error,
        content: '${e.toString()}...',
      );
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    _contentController.text = journal.content;

    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()),
        actions: [
          IconButton(
            onPressed: () {
              saveJournal(context).then(
                (value) => Navigator.pop(context, value),
              );
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3))),
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }
}
