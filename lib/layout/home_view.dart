import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import '../data/models/user_model.dart';
import '../services/login/login_service.dart';


class HomeView extends StatelessWidget{


  Color ActiveColor = Color(0xFF005DA3);
     UserModel? model;

   HomeView(this.model);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(

    listener: (BuildContext context, state) {
        },
        builder: (BuildContext context,  state) {

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                child:
                Text(
                  "User Data",style: TextStyle(
                  fontSize:20.0,
                  color: Colors.white,

                ),
                ),
              ),
            ),
            body: Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) =>  state != GlobalLoading(),
              widgetBuilder: (BuildContext context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Email : ${model!.data?.email}",style: TextStyle(
                          fontSize:20.0,
                          color: ActiveColor,

                        ),)),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Phone : ${model!.data?.phone}",style: TextStyle(
                          fontSize:20.0,
                          color: ActiveColor,

                        ),)),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Name : ${model!.data?.name}",style: TextStyle(
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
                          // final logoutValue = await LoginService().logout();
                          // if (logoutValue == true) {
                          Navigator.pop(context);
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
              fallbackBuilder: (BuildContext context) => CircularProgressIndicator(),
            ),

          );
        },
      );
  }
}
