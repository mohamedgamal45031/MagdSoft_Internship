import 'package:flutter/material.dart';
import '../data/models/user_model.dart';
import '../services/login/login_service.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color ActiveColor = Color(0xFF005DA3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "User Data",style: TextStyle(
            fontSize:20.0,
            color: Colors.white,

          ),
          ),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                  child: Text("Name : Ahmed",style: TextStyle(
                    fontSize:20.0,
                    color: ActiveColor,

                  ),)),
              Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Email : ahmed@gmail.com",style: TextStyle(
                    fontSize:20.0,
                    color: ActiveColor,

                  ),)),
              Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Phone : 01152226320",style: TextStyle(
                    fontSize:20.0,
                    color: ActiveColor,

                  ),)),
              SizedBox(height: 50),
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                child: MaterialButton(
                  height: 61.0,
                  minWidth: 152.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.red,
                  onPressed: () async {
                    final logoutValue = await LoginService().logout();
                    if (logoutValue == true) {
                      Navigator.pop(context);
                    }
                    else{
                      Navigator.pop(context);
                    }
                  },
                  child:Text("Logout",style: TextStyle(
                    fontSize: 15,
                    color:Color(0xffFFFFFF),
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
