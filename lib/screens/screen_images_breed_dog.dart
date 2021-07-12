import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sorokin_dogs_showcases_project/Models/breed_model.dart';

class ImageScreen extends StatefulWidget {
  static const routeName = '/imageScreen';

  const ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    BreedModel breedModel =
        ModalRoute.of(context)!.settings.arguments as BreedModel;

    String _name = '${breedModel.name}';
    String _subName = '${breedModel.subName}';

    String mixLink = (_subName.isEmpty && _subName == 'null')
        ? 'https://dog.ceo/api/breed/$_name/$_subName/images'
        : 'https://dog.ceo/api/breed/$_name/images';

    Future<List<dynamic>> getImagesDog() async {
      var url = Uri.parse(mixLink);
      var response = await http.get(url);

      final imagesAddress = <dynamic>[];
      if (response.statusCode == 200) {
        final responseAsList = jsonDecode(response.body);
        final List<dynamic> addresses = responseAsList['message'];
        for (final address in addresses) {
          imagesAddress.add(address);
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      return imagesAddress;
    }

    String _title = (_subName.isEmpty || _subName == 'null')
        ? '$_name'
        : '$_name $_subName';

    Future<List<dynamic>> imagesBreeds = getImagesDog();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: FutureBuilder<List>(
          future: imagesBreeds,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        snapshot.data![index],
                        fit: BoxFit.cover,
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
