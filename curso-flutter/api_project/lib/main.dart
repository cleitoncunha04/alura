import 'package:api_project/models/journal.dart';
import 'package:api_project/screens/add_journal_screen/add_journal_screen.dart';
import 'package:api_project/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLogged = await verifyTokenExists();

  runApp(MyApp(isLogged: isLogged));
}

Future<bool> verifyTokenExists() async {
  SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  return await asyncPrefs.getString('accessToken') != null;
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isLogged,
  });
  final bool isLogged;

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
            ),
          ),
          textTheme: GoogleFonts.notoSansOsageTextTheme(),
          iconTheme: IconThemeData(
            color: Colors.grey[600],
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        initialRoute: isLogged ? 'home' : 'login',
        routes: {
          "home": (context) => const HomeScreen(),
          'login': (context) => LoginScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == 'add-journal') {
            Map<String, dynamic> map =
                settings.arguments as Map<String, dynamic>;

            final Journal journal = map['journal'] as Journal;

            final bool isEditing = map['is_editing'];

            return MaterialPageRoute(
              builder: (context) => AddJournalScreen(
                journal: journal,
                isEditing: isEditing,
              ),
            );
          }
          return null;
        });
  }
}
