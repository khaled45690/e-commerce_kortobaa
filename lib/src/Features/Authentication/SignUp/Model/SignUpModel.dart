// ignore_for_file: file_names

class SignUpModel {
  String? first_name;
  String? last_name;
  String? username;
  String? email;
  String? password;
  String? confirmPassword;
  String? imageName;
  SignUpModel();
  Map toMap() {
    Map signIn = {
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
    return signIn;
  }

  fromMap(Map signIn) {
    first_name = signIn["first_name"];
    last_name = signIn["last_name"];
    username = signIn["username"];
    email = signIn["email"];
    password = signIn["password"];
    confirmPassword = signIn["confirmPassword"];
  }

  bool isSame(Map signIn) {
    if (signIn["email"] == null ||
        signIn["password"] == null ||
        signIn["confirmPassword"] == null ||
        signIn["first_name"] == null ||
        signIn["username"] == null ||
        signIn["last_name"] == null) return false;

    return true;
  }
}
