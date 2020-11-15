import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:todoapp/models/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Future<User> registerUser(String username, String firstname, String lastname,
      String emailadress, String password) async {
    final response = await client
        .post("http://10.0.2.2:5000/api/register",
        // headers: "",
        body: jsonEncode({
          "emailadress": emailadress,
          "username": username,
          "password": password,
          "firstname": firstname,
          "lastname": lastname
        }
        )
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      // if the call to the server was successful,parse the JSON
      await saveApiKey(result["data"]["api_key"]);
      return User.fromJson(result["data"]);
    } else {
      // if that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future signinUser(String username, String password) async {
    final response = await client
        .post("http://10.0.2.2:5000/api/sigin",
        // headers: "",
        body: jsonEncode({
          "username": username,
          "password": password,
        }
        )
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      // if the call to the server was successful,parse the JSON
      await saveApiKey(result["data"]["api_key"]);
    } else {
      // if that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
   saveApiKey(String api_key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('API_Token', api_key);

  }
}