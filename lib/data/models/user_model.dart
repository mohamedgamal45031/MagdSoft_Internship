import 'package:flutter/material.dart';

class UserModel {

  int? status;
  UserData? data ;
  UserModel.fromJson(Map<String,dynamic>json){
    this.status= json['status'];
    this.data= json['account'][0]!=null ?UserData.fromJson(json['account'][0]):null ;
  }
}

class UserData{
   int? id;
   String? email;
   String? password;
   String? name;
   String? phone;
   String? updated_at;
   String? created_at;

  UserData.fromJson(Map<String,dynamic>map){
    this.id= map['id'];
    this.email= map['email'];
    this.password= map['password'];
    this.name= map['name'];
    this.phone= map['phone'];
    this.updated_at= map['updated_at'];
    this.created_at= map['created_at'];

  }



}