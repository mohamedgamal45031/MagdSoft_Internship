

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';

import '../business_logic/login_interface.dart';
import '../data/models/user_model.dart';
import '../services/login/login_service.dart';
import 'Register_Screen.dart';
import 'home_view.dart';


class LoginScreen extends StatelessWidget {
  Color ActiveColor = Color(0xFF005DA3);
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final ILogin _loginService = LoginService();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return BlocProvider(
      create: (BuildContext context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
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
                                      controller: passController,
                                      obscureText:  obsecure,
                                      textInputAction: TextInputAction.done,
                                      onEditingComplete: () async {},
                                      onFieldSubmitted: (value)
                                      async {
                                        if(formKey.currentState!.validate())
                                        {
                                          GlobalCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passController.text,
                                          );
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
                                            if(formKey.currentState!.validate())
                                            {
                                              GlobalCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password: passController.text,
                                              );
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) =>HomeView()),
                                              );
                                            }
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
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>RegisterScreen()),
                                            );
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
