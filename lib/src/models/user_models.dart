import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_models.g.dart';

@JsonSerializable()
class UserModel {
  String? name; 
  String? email;
  String? phone;
  String? password;
  String? id;
  String? token;
  
  UserModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.id,
    this.token,
  });

  
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
 



  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, password: $password, id: $id, token: $token)';
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'password': password,
  //     'id': id,
  //     'token': token,
  //   };
  // }

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     name: map['name'] != null ? map['name'] as String : null,
  //     email: map['email'] != null ? map['email'] as String : null,
  //     phone: map['phone'] != null ? map['phone'] as String : null,
  //     password: map['password'] != null ? map['password'] as String : null,
  //     id: map['id'] != null ? map['id'] as String : null,
  //     token: map['token'] != null ? map['token'] as String : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
