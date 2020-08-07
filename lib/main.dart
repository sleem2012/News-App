import 'package:flutter/material.dart';
import 'package:news_app/screens/onbording.dart';
import 'package:news_app/utilities/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen ;

  if (seen == null|| seen ==false ) {
    _screen = OnBording();
  } else{
    _screen=HomeScreen();
  }
    runApp(
      NewApp(_screen),
    );
}

class NewApp extends StatelessWidget {
  final Widget _screen;

  NewApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: this._screen,
    );
  }
}
