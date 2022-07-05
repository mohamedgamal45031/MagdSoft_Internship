// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import '../data/models/user_model.dart';
//
// abstract class ILogin {
//   Future<UserModel?> login(String email, String password) async {
//     final api = 'https://magdsoft-internship.herokuapp.com/api/login';
//     final data = {"email": email, "password": password};
//     final dio = Dio();
//     Response response;
//     response = await dio.post(api, data: data);
//     if (response.statusCode == 200) {
//       final body = response.data;
//       return UserModel(email: email, password: body['password']);
//     } else {
//       return null;
//     }
//   }
//
//   Future<UserModel?> getUser() async {
//     SharedPreferences storage = await SharedPreferences.getInstance();
//     final password = storage.getString('PASSWORD');
//     final email = storage.getString('EMAIL');
//     if (password != null && email != null) {
//       return UserModel(email: email, password: password);
//     } else {
//       return null;
//     }
//   }
//
//   Future<bool> logout() async {
//     SharedPreferences storage = await SharedPreferences.getInstance();
//     return true;
//   }
// }
