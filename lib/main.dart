import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cubit_test/screen/home_screen.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'core/supabase/set_initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  // await SupabaseInitialize.initialize();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/locales', 
        fallbackLocale: Locale('en', 'US'),
        child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeScreen(),
    );
  }
}
