import 'package:flutter/material.dart';
import 'package:api_project/helpers/weekday.dart';
import 'package:api_project/models/journal.dart';
import 'package:uuid/uuid.dart';

class JournalCard extends StatelessWidget {
  final Journal? journal;
  final DateTime showedDate;
  final Function refreshFunction;
  const JournalCard({
    super.key,
    this.journal,
    required this.showedDate,
    required this.refreshFunction,
  });

  callAddJournalScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      'add-journal',
      arguments: Journal(
        id: const Uuid().v1(),
        content: '',
        createdAt: showedDate,
        updatedAt: showedDate,
      ),
    ).then((result) {
      if (result != null && result == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Journal added successfully...'),
          ),
        );
      }

      refreshFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journal != null) {
      return InkWell(
        onTap: () {},
        child: Container(
          height: 115,
          margin: const EdgeInsets.only(
            top: 8,
            right: 16,
            bottom: 8,
            left: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black87,
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                      ),
                      border: Border(
                          right: BorderSide(color: Colors.black87),
                          bottom: BorderSide(color: Colors.black87)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      journal!.createdAt.day.toString(),
                      style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black87),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(WeekDay(journal!.createdAt).short),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    journal!.content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          callAddJournalScreen(context);
        },
        child: Container(
          height: 115,
          alignment: Alignment.center,
          child: Text(
            "${WeekDay(showedDate).short} - ${showedDate.day}",
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
