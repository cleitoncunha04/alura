import 'package:api_project/models/custom_snackbar_enum.dart';
import 'package:api_project/screens/common/confirmation_dialog.dart';
import 'package:api_project/screens/common/custom_snackbar.dart';
import 'package:api_project/services/journal_service.dart';
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

  callAddJournalScreen(BuildContext context, {Journal? journal}) {
    Journal innerJournal = Journal(
      id: const Uuid().v1(),
      content: '',
      createdAt: showedDate,
      updatedAt: showedDate,
    );

    Map<String, dynamic> map = {};

    if (journal != null) {
      innerJournal = journal;

      map['is_editing'] = true;
    } else {
      map['is_editing'] = false;
    }

    map['journal'] = innerJournal;

    Navigator.pushNamed(
      context,
      'add-journal',
      arguments: map,
    ).then((result) {
      if (result != null && result == true) {
        showCustomSnackBar(
          context: context,
          type: CustomSnackBarTypes.success,
          content: 'Journal saved successfully...',
        );
      } else {
        showCustomSnackBar(
          context: context,
          type: CustomSnackBarTypes.error,
          content: 'Error on adding Journal...',
        );
      }

      refreshFunction();
    });
  }

  removeJournal(BuildContext context) {
    if (journal != null) {
      showConfirmationDialog(context,
              content:
                  'Do you really wanna remove Journal of this day (${WeekDay(journal!.createdAt)})?')
          .then((value) {
        if (value) {
          JournalService journalService = JournalService();

          journalService.delete(journal!.id).then(
            (value) {
              if (value) {
                showCustomSnackBar(
                  context: context,
                  type: CustomSnackBarTypes.success,
                  content: 'Journal removed successfully...',
                );

                refreshFunction();
              } else {
                showCustomSnackBar(
                  context: context,
                  type: CustomSnackBarTypes.error,
                  content: 'Error on removing Journal...',
                );
              }
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (journal != null) {
      return InkWell(
        onTap: () => callAddJournalScreen(context, journal: journal),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => removeJournal(context),
                  icon: const Icon(
                    Icons.delete,
                    size: 36,
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
