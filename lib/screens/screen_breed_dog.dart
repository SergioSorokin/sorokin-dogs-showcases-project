import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:sorokin_dogs_showcases_project/Models/breed_model.dart';

import '../Models/get_dogs.dart';

class BreedDog extends StatefulWidget {
  const BreedDog({Key? key}) : super(key: key);

  @override
  _BreedDogState createState() => _BreedDogState();
}

class _BreedDogState extends State<BreedDog> {
  List<BreedModel> breeds = [];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                GetDogs().getDogs();
              });

              // print(lts2);
            },
            child: Icon(
              Icons.get_app,
            )),
        appBar: AppBar(
          title: Text('BreedDogs'),
        ),
        body: ListView.builder(
            itemCount: breeds.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {},
                  title: Center(
                      child: Text(''
                    '${breeds[index]}',
                  )),
                ),
              );
            }),
      ),
    );
  }
}
