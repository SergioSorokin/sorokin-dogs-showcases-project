import 'package:flutter/material.dart';

class BreedDogs extends StatefulWidget {
  BreedDogs({Key? key}) : super(key: key);

  @override
  _BreedDogsState createState() => _BreedDogsState();
}

class _BreedDogsState extends State<BreedDogs> {
  final List<String> lts = [
    "husky",
    "keeshond",
    "kelpie",
    "komondor",
    "kuvasz",
    "labradoodle",
    "labrador",
    "leonberg",
    "lhasa",
    "malamute",
    "malinois",
    "maltese",
    "mastiff",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BreedDogs'),
        ),
        body: ListView.builder(
            itemCount: lts.length,
            // shrinkWrap: true,
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
