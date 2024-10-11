import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cubit_test/screen/home_screen.dart';
import 'package:sizer/sizer.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'core/supabase/set_initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  // await SupabaseInitialize.initialize();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/locales',
        fallbackLocale: const Locale('en', 'US'),
        child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const HomeScreen(),
        );
      },
    );
  }
}
