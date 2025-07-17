import 'package:flutter/material.dart';
import 'package:habit_tracker/core/dependency_injection/injection.dart';
import 'package:habit_tracker/core/hive/hive_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.init();         // 1. Init Hive & register adapters
  await configureDependencies();  
  runApp(MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
