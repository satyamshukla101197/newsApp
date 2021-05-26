import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Models/new_articles_Model.dart';
import 'package:http/http.dart'as http;
class ControllerState extends ControllerMVC{
  late GlobalKey<ScaffoldState> scaffoldKey;

  Controller() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  List<HomeScreen> data=[];
  Future<List<HomeScreen>> getdata()async{
    final response=await http.get(Uri.parse("https://spaceflightnewsapi.net/api/v2/articles"));

    List resbody=json.decode(response.body);
    print("jjjjjjjjjjjjjjjjjjjjjjjjjjjj");


    return resbody.map((data) => HomeScreen.fromMap(data)).toList();
  }
  @override
  void initState() {
    this.getdata();
    super.initState();
  }

}