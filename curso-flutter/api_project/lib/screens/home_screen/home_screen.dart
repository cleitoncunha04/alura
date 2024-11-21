import 'dart:io';

import 'package:api_project/helpers/logout.dart';
import 'package:api_project/models/custom_snackbar_enum.dart';
import 'package:api_project/models/user.dart';
import 'package:api_project/screens/common/custom_snackbar.dart';
import 'package:api_project/services/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:api_project/screens/home_screen/widgets/home_screen_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/journal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDay = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();

  JournalService journalService = JournalService();

  User? user;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() async {
    try {
      SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

      String? accessToken = await asyncPrefs.getString('accessToken');
      String? email = await asyncPrefs.getString('email');
      int? id = await asyncPrefs.getInt('id');

      if (accessToken != null && email != null && id != null) {
        setState(() {
          user = User(
            accessToken: accessToken,
            email: email,
            id: id,
          );
        });

        List<Journal> journals = await journalService.getAll(
            token: user!.accessToken!, id: user!.id!);

        setState(() {
          database = {};

          for (Journal journal in journals) {
            database[journal.id] = journal;
          }
        });
      } else {
        Navigator.pushReplacementNamed(context, 'login');
      }
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título basado no dia atual
        title: Text(
          "${currentDay.day}/${currentDay.month}/${currentDay.year}",
        ),
        actions: [
          IconButton(
            onPressed: () => refresh(),
            icon: const Icon(
              Icons.sync,
            ),
          ),
        ],
      ),
      body: (user != null)
          ? ListView(
              controller: _listScrollController,
              children: generateListJournalCards(
                windowPage: windowPage,
                currentDay: currentDay,
                refreshFunction: refresh,
                database: database,
                userId: user!.id!,
                token: user!.accessToken!,
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.grey[700],
              ),
            ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  onTap: () => logout(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.grey[700],
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      )
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
