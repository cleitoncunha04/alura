import 'package:api_project/models/journal.dart';
import 'package:api_project/screens/add_journal_screen/add_journal_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());

  // JournalService journalService = JournalService();

  // journalService.post(Journal.empty());

  // journalService.get();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple Journal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.grey,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.black,
              titleTextStyle: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              actionsIconTheme: const IconThemeData(
                color: Colors.white,
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              )),
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        initialRoute: "home",
        routes: {
          "home": (context) => const HomeScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == 'add-journal') {
            final Journal journal = settings.arguments as Journal;

            return MaterialPageRoute(
              builder: (context) => AddJournalScreen(journal: journal),
            );
          }
          return null;
        });
  }
}
