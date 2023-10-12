import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/screens/add_journal_screen/add_journal_screen.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
  //comunicador com a api fake
  JournalService service = JournalService();
  // service.register("testando");
  // service.get();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      //adicioando meu próprio tema
      theme: ThemeData(
          textTheme: GoogleFonts.bitterTextTheme(),
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.amber,
              titleTextStyle: TextStyle(
                color: Colors.black,
              ))),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "add-journal",
      routes: {
        "home": (context) => const HomeScreen(),
        "add-journal": (context) => AddJournalScreen(
            journal: Journal(
                id: "id",
                content: "content",
                createdAt: DateTime.now(),
                updatedAt: DateTime.now()))
      },
    );
  }
}
