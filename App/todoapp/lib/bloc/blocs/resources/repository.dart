import 'dart:async';
import 'api.dart';
import 'package:todoapp/models/classes/user.dart';

class Repository {
   final apiProvider = ApiProvider();

   Future<User> registerUser(String username, String firstName, String lastName, String email, String password)
   => apiProvider.registerUser(username, firstName, lastName, email, password);

   Future signinUser(String username,  String password, String apiKey)
   => apiProvider.signinUser(username, password, apiKey);

   Future getUserTasks(String apiKey)
   => apiProvider.getUserTasks(apiKey);

   Future<Null> addUserTask(String apiKey, String taskName, String deadline) async {
     apiProvider.addUserTask(apiKey, taskName, deadline);
      }
}