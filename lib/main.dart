import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weatherapp/presentation/homeScreen/binding/home_screen_binding.dart';
import 'package:weatherapp/presentation/homeScreen/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',

     getPages: [
       GetPage(name: '/', page:()=> Homescreen(),binding: HomeBindings())
     ],
      initialBinding: HomeBindings(),

      theme: ThemeData(

      ),

    );
  }
}
