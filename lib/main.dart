import 'package:flutter/material.dart';
import 'package:sorokin_dogs_showcases_project/Models/breed_model.dart';

import 'screens/screen_breed_dog.dart';
import 'screens/screen_images_breed_dog.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //

        primarySwatch: Colors.blue,
      ),
      routes: {
        BreedDog.routeName:(context)=>BreedDog(),
        ImageScreen.routeName:(context)=>ImageScreen()
      },
      home: BreedDog(
      ),
    );
  }
}
