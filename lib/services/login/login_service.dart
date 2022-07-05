// import 'package:dio/dio.dart';
// import 'package:magdsoft_flutter_structure/data/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../../business_logic/login_interface.dart';
// class LoginService extends ILogin {
//   @override
//   Future<UserModel?> login(String email, String password) async {
//     final api = Uri.parse('https://magdsoft-internship.herokuapp.com/api/login');
//     final data = {"email": email, "password": password};
//     // final dio = Dio();
//     http.Response response;
//     response = await http.post(api, body: data);
//     if (response.statusCode == 200) {
//       SharedPreferences storage = await SharedPreferences.getInstance();
//       final body = json.decode(response.body);
//       await storage.setString('PASSWORD', body['password']);
//       await storage.setString('EMAIL', email);
//       return UserModel(email: email, password: body['password']);
//     }
//   }
//
//   @override
//   Future<UserModel?> getUser() async {
//     SharedPreferences storage = await SharedPreferences.getInstance();
//     final password = storage.getString('PASSWORD');
//     final email = storage.getString('EMAIL');
//     if (password != null && email != null) {
//       return UserModel(email: email, password: password);
//     }
//   }
//
//   @override
//   Future<bool> logout() async {
//     SharedPreferences storage = await SharedPreferences.getInstance();
//     final email = storage.getString('EMAIL');
//     final password = storage.getString('PASSWORD');
//     if (email != null && password != null) {
//       await storage.remove('PASSWORD');
//       await storage.remove('EMAIL');
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
