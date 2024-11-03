import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:homework_list/routes.dart';

import 'Core/class/MyTranslations.dart';
import 'Core/service/my_service.dart';
import 'Core/service/routes.dart';
import 'binding/intial_binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  MyService();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBindings(),
      getPages: routes,
      initialRoute: Routes.HomeScreen,
      translations: MyTranslation(),
      locale: const Locale('ar', 'SA'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}

