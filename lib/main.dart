import 'package:flutter/material.dart';

import 'Models/models_dogs.dart';
import 'dogs.dart';
import 'screens/breed_list_screen.dart';

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
      home: BreedDog(
      ),
    );
  }
}
