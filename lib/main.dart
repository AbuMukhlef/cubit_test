import 'package:flutter/material.dart';
import 'package:cubit_test/screen/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'supabase/set_initialize.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupabaseInitialize.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
