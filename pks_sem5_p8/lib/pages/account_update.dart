import 'dart:convert';

import 'package:flutter/material.dart';
import '/main.dart';
import '/models/account.dart';
import 'package:http/http.dart' as http;

class AccountUpdatePage extends StatelessWidget{
  AccountUpdatePage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Редактировать профиль")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25,),
            Icon(Icons.account_circle, size: 150.0),
            SizedBox(height: 10,),
            TextField(controller: nameController, decoration: InputDecoration(
              labelText: "Имя"
            ),),
            SizedBox(height: 10,),
            TextField(controller: emailController, decoration: InputDecoration(
              labelText: "Эл. почта"
            ),),
            SizedBox(height: 10,),
            TextField(
              controller: phoneNumberController
              , decoration: InputDecoration(
              labelText: "Телефон"
            ),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: () async {
              int id = appData.account!.ID;
              appData.account = Account(1, nameController.text, emailController.text, phoneNumberController.text);
              http.put(Uri(scheme: "http", host: appData.serverHost, port: appData.serverPort, path: "/user"), body: jsonEncode(appData.account!.toJson()), headers: {"Content-Type" : "application/json"});
              appData.accountPageState!.forceUpdateState();
              Navigator.pop(context);
            }, child: Text("Сохранить данные", style: TextStyle(fontSize: 18),),),
          ],
        ),
      )
    );
  }
}