import 'package:api_project/services/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:api_project/screens/home_screen/widgets/home_screen_list.dart';

import '../../models/journal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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

  @override
  void initState() {
    refresh();
    super.initState();
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
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage,
          currentDay: currentDay,
          refreshFunction: refresh,
          database: database,
        ),
      ),
    );
  }

  void refresh() async {
    List<Journal> journals = await journalService.getAll();
    setState(() {
      database = {};

      for (Journal journal in journals) {
        database[journal.id] = journal;
      }
    });
  }
}
