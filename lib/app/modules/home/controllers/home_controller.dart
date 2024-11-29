import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeController extends GetxController {
  //TODO: Implement HomeController
  Map<String,String?> userdata =Get.parameters;

  final count = 0.obs;
  List<dynamic>? list = [];
  //late Int length ;
 // DatabaseReference? databaseRef;
  late AsyncSnapshot<DatabaseEvent> snapshot;
  final databaseRef = FirebaseDatabase.instance.ref('Categories');
  final databaseRefnew = FirebaseDatabase.instance.ref('CyberSecuritydata');




  // Map<String, String> bodyParams = {
  //   "otherurl": databaseRef.,
  //   "select": LasttName.text,
  //     "subtitle": EmailAddress.text,
  //  "title": Password.text,
  // };





  //late List<Categories> datalist = Categories.cateItem;
  //late RxList<OpeningCourse> datalistOpeningCourse = OpeningCourse.openingCourceitem.obs;


  @override
 void onInit()  {
    get();
    increment();
    super.onInit();
  }

  @override
  void onReady() {
    //print("data is : ${list?.length}");
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }






  dataupload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("email"));
    print(prefs.getString("password"));
    print(prefs.getString("token"));
    print(prefs.getString("userid"));
    print(prefs.getString("name"));
    print(prefs.getBool("isLogin"));

    // DatabaseReference databaseReference =
    // FirebaseDatabase.instance.ref().child('Categories');
    // databaseReference.push().set({
    //   'name': 'Coding',
    //   'image': 'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/programing.png?alt=media&token=f904f69b-fe0c-49c5-96d8-4ac338653ffd',
    //   'id': '1',
    //   'otherlink': 'Coding',
    // });
  }


  void increment() => count.value++;


    Future<void> get() async {
      var snapshot = await databaseRef.get();
    for (var childSnapshot in snapshot.children) {
      var props = childSnapshot.value! as Map;

      list = snapshot.value as List;

    //  print("data is : ${props["otherurl"]}");
      //print("data is : ${snapshot.children.length}");
      //

    }

    //length =list?.length as Int;

      increment();
      //print("data is : ${snapshot.value}");
      print("data is : ${list?[0]["otherurl"]}");


  }
}

