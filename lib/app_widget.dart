
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/layout/LoginScreen.dart';
import 'package:magdsoft_flutter_structure/services/login/login_service.dart';
import 'layout/home_view.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: LoginService().getUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 3.0,
                  ),
                );
              case ConnectionState.none:
                return LoginScreen();
              default:
                  return LoginScreen();
            }
          },
        ),

        routes: {
          '/login': (_) => LoginScreen(),
        },
    );
  }
}
