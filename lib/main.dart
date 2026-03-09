
import 'package:docdoc/features/auth/register/presentation/screen/register_screen.dart';
import 'package:docdoc/features/spalsh/presentation/screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/helper/cash_helper.dart';
import 'core/helper/dio_helper.dart';
import 'core/helper/generic_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await GenericHelper.init();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();

  runApp( EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: "assets/translations", // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white

      ),
      home: SplashScreen(),
    );
  }
}