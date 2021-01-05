import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:news_app/presentation/journyes/home_screen.dart';
import 'package:pedantic/pedantic.dart';
import 'package:news_app/di/get_it.dart' as getIt;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
