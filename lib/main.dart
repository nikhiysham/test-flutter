import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Flutter',
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Avant',
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 14.0),
              bodyText2: TextStyle(fontSize: 14.0),
              button: TextStyle(fontSize: 14.0) // and so on for every text style
              )),
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
