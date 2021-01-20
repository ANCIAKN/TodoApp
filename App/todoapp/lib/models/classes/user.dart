

class User {
  String username;
  String lastName;
  String firstName;
  String email;
  String password;
  String api_key;
  int id;

  User(this.username, this.lastName, this.firstName, this.email, this.password, this.api_key, this.id);

 factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      parsedJson['username'],
      parsedJson['lastName'],
      parsedJson['firstName'],
      parsedJson['email'],
      parsedJson['password'],
      parsedJson['api_key'],
      parsedJson['id']
    );
  }
}