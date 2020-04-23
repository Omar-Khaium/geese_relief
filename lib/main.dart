import 'package:flutter/material.dart';
import 'package:geese_relief/model/hive/search_suggestion.dart';
import 'package:geese_relief/ui/ui_dashboard.dart';
import 'package:geese_relief/ui/ui_login.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(SearchSuggestionAdapter());
  runApp(
    new MaterialApp(
      home: new LauncherUI(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade800,
        primarySwatch: Colors.blueGrey,
        backgroundColor: Color(0xFFECEEF8),
        cursorColor: Colors.blueGrey.shade900
      ),
    ),
  );
}

class LauncherUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoginState(),
    );
  }
}
