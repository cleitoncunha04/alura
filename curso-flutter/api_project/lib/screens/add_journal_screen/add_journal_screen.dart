import 'package:api_project/helpers/weekday.dart';
import 'package:api_project/models/journal.dart';
import 'package:api_project/services/journal_service.dart';
import 'package:flutter/material.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;

  AddJournalScreen({super.key, required this.journal});

  final TextEditingController _contentController = TextEditingController();

  Future<bool> registerJournal() async {
    String content = _contentController.text;

    JournalService journalService = JournalService();

    journal.content = content;

    return await journalService.post(journal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal().then(
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
