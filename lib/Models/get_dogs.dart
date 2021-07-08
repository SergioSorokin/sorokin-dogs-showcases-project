import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sorokin_dogs_showcases_project/Models/breed_model.dart';

class GetDogs {
  Future<List<BreedModel>> getDogs() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/list/all');

    // Await the http get response, then decode the json-formatted response.
    // Дождитесь ответа http get, затем расшифруйте ответ в формате json.
    var response = await http.get(url);
    final breeds = <BreedModel>[];
    if (response.statusCode == 200) {
      final responseAsMap = jsonDecode(response.body);
      final Map<String?, dynamic> dogs = responseAsMap['message'];
      for (final entry in dogs.entries) {
        final key = entry.key;
        if (key != null && key.isNotEmpty) {
          final List<dynamic>? subBreeds = entry.value;
          if (subBreeds != null && subBreeds.isNotEmpty) {
            for (final subBreed in subBreeds) {
              breeds.add(BreedModel(name: key, subName: subBreed));
            }
          } else {
            breeds.add(BreedModel(name: key));
          }
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    print(breeds);
    return breeds;
  }
}
