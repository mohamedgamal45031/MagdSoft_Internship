

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/layout/LoginScreen.dart';

import '../business_logic/login_interface.dart';
import '../data/models/user_model.dart';
import '../services/login/login_service.dart';
import 'home_view.dart';


class RegisterScreen extends StatelessWidget {
  Color ActiveColor = Color(0xFF005DA3);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final pass2Controller = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  // final ILogin _loginService = LoginService();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return BlocProvider(
      create: (BuildContext context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {
          if(state is GlobalRegisterSuccess){
            if(state.userRegisterModel.status==200){
              Fluttertoast.showToast(
                  msg: "${state.userRegisterModel.message}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }else{
              Fluttertoast.showToast(
                  msg: "${state.userRegisterModel.message}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = GlobalCubit.get(context);
          final obsecure = cubit.showPass;
          return Scaffold(
            body: Container(
              color: ActiveColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 48.0, right: 21.0),
                      alignment: AlignmentDirectional.topEnd,
                      child:MaterialButton(
                        height: 31.0,
                        minWidth: 84.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Color(0xffFFFFFF),
                        onPressed: (){},
                        child:Text("عربي",style: TextStyle(
                          fontSize: 15,
                          color:ActiveColor,
                        ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 167.0,
                        width: 227.0,
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(40) ,topRight: Radius.circular(40))
                      ),

                      child: Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 150.0),
                        padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                              children:[
                                Container(
                                  margin: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    controller: nameController,
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your Full name';
                                      }
                                    },
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(

                                      labelText: "Full Name",
                                      border: OutlineInputBorder(),

                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    controller: emailController,
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your email address';
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(

                                      labelText: "Email",
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.email),

                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    controller: phoneController,
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your Phone number';
                                      }
                                    },
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      labelText: "Phone",
                                      border: OutlineInputBorder(),


                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    controller: passController,
                                    obscureText:  obsecure,
                                    textInputAction: TextInputAction.done,
                                    onEditingComplete: () async {

                                    },
                                    onFieldSubmitted: (value)
                                    async {
                                      if(formKey.currentState!.validate())
                                      {

                                        // UserModel? user = await _loginService.login(
                                        //     emailController.text,passController.text);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => HomeView(user: user!)),
                                        // );
                                      }
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'password is too short';
                                      }
                                    },
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Password",
                                      prefixIcon: Icon(Icons.vpn_key),
                                      suffixIcon: IconButton(
                                        icon: obsecure? Icon(Icons.visibility_off,):Icon(Icons.visibility,),
                                        onPressed: () { cubit.ChangePasswordMode();
                                        },),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    controller: pass2Controller,
                                    obscureText:  obsecure,
                                    textInputAction: TextInputAction.done,
                                    onEditingComplete: () async {},
                                    onFieldSubmitted: (value)
                                    async {
                                      if(formKey.currentState!.validate())
                                      {

                                        // UserModel? user = await _loginService.login(
                                        //     emailController.text,passController.text);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => HomeView(user: user!)),
                                        // );
                                      }
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'password is too short';
                                      }
                                    },
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Confirm Password",
                                      prefixIcon: Icon(Icons.vpn_key),
                                      suffixIcon: IconButton(
                                        icon: obsecure? Icon(Icons.visibility_off,):Icon(Icons.visibility,),
                                        onPressed: () { cubit.ChangePasswordMode();
                                        },),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      child: MaterialButton(
                                        height: 61.0,
                                        minWidth: 152.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)),
                                        color:ActiveColor ,
                                        onPressed: ()async{
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>LoginScreen()),
                                          );
                                          // print(user!.password.toString());
                                        },
                                        child:Text("Login",style: TextStyle(
                                          fontSize: 15,
                                          color:Color(0xffFFFFFF),
                                        ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: AlignmentDirectional.bottomStart,
                                      child: MaterialButton(
                                        height: 61.0,
                                        minWidth: 152.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)),
                                        color:ActiveColor ,
                                        onPressed: ()async{
                                          if(formKey.currentState!.validate())
                                          {
                                            GlobalCubit.get(context).userRegister(
                                              email: emailController.text,
                                              name: nameController.text,
                                              phone: phoneController.text,
                                              password: passController.text,
                                            );

                                            print("Lol I'm here");
                                            print(GlobalCubit.get(context).userRegisterModel?.message);

                                            await Future.delayed(const Duration(seconds: 5), (){});
                                            // UserModel? user = await _loginService.login(
                                            //     emailController.text,passController.text);
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(builder: (context) => HomeView(user: user!)),
                                            // );
                                          }
                                        },
                                        child:Text("Register",style: TextStyle(
                                          fontSize: 15,
                                          color:Color(0xffFFFFFF),
                                        ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height- 610.0,)
                                  ],
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}
