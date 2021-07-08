import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import 'Models/models_dogs.dart';

class BreedDog extends StatelessWidget {
  BreedDog({
    Key? key,
  }) : super(key: key);

  // final List<String> lts = [
  //   "husky",
  //   "keeshond",
  //   "kelpie",
  //   "komondor",
  //   "kuvasz",
  //   "labradoodle",
  //   "labrador",
  //   "leonberg",
  //   "lhasa",
  //   "malamute",
  //   "malinois",
  //   "maltese",
  //   "mastiff",
  // ];
  @override
  Widget build(BuildContext context) {
    final List<GetDogs> lts = [];

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              var dogs = GetDogs();
              dogs.getDogs();
              var lts = dogs.test;

            },
            child: Icon(
              Icons.get_app,
            )),
        appBar: AppBar(
          title: Text('BreedDogs'),
        ),
        body: ListView.builder(
            itemCount: lts.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {},
                  title: Center(
                      child: Text(
                    '${lts[index]}',
                  )),
                ),
              );
            }),
      ),
    );
  }
}
