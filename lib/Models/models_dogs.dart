import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sorokin_dogs_showcases_project/Models/dogs.dart';

class GetDogs {
  int i = 0;
  // String? key;
  // String? value;
  var test = [];



  Future<void> getDogs() async {

    var url = Uri.parse('https://dog.ceo/api/breeds/list/all');

    // Await the http get response, then decode the json-formatted response.
    // Дождитесь ответа http get, затем расшифруйте ответ в формате json.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      Map inMessage = jsonResponse['message'];

      for (var key in inMessage.keys) {
        //print(inMessage[key]);
       var breed = Breed(name: key, subName: inMessage[key]);

        test.add(breed);

        // for (value in inMessage[key]) {
        //   // i++;
        //   // print(i);
        //
        //   tt['subname'] = value!;
        //
        //   // test.add(value);
        //   // print(key);
        //   // print(value);
        // }
        // // test2.add(tt);
        // // test2.add(key);
        // // print(key);
        // // print(subName);
      }
      //print(test[0].name);
      //print(test[1].name);
      for(var i in test){
        print(i.name);
        //print(test[i].name);
      }
      // print(test2);
      // print(test);
      // print(key);
      // print(value);
      // print(subName.toString());
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }


  }
}
