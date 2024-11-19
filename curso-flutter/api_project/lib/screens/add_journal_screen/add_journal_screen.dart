import 'package:api_project/helpers/weekday.dart';
import 'package:api_project/models/journal.dart';
import 'package:api_project/services/journal_service.dart';
import 'package:flutter/material.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final bool isEditing;

  AddJournalScreen({
    super.key,
    required this.journal,
    required this.isEditing,
  });

  final TextEditingController _contentController = TextEditingController();

  Future<bool> saveJournal() async {
    String content = _contentController.text;

    JournalService journalService = JournalService();

    journal.content = content;

    return isEditing
        ? await journalService.put(journal.id, journal)
        : await journalService.post(journal);
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
              saveJournal().then(
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
