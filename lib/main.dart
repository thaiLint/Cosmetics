
<<<<<<< HEAD
import 'package:cosmetics/views/bottombart.dart';
=======

>>>>>>> 8c1f49dff60b96bcdb5d4e78dd18ec0f39307a01
import 'package:cosmetics/views/categories.dart';

import 'package:cosmetics/views/profile_setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

<<<<<<< HEAD
      home:Bottombart(),
=======
      home:Categories(),
>>>>>>> 8c1f49dff60b96bcdb5d4e78dd18ec0f39307a01
    );
  }
}
