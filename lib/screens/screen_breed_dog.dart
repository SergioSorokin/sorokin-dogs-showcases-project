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
  Future<List<BreedModel>> breeds = GetDogs().getDogs();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BreedDogs'),
          ),
        ),
        body: FutureBuilder<List>(
          future: breeds,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      title: Center(
                        child: Text(
                          '${snapshot.data![index]}',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
