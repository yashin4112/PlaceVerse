import 'package:async_builder/async_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:placeverse/stud_data/view.dart';

class OneDataView extends StatefulWidget {
  // late String company;
  OneDataView({super.key});

  @override
  State<OneDataView> createState() => _OneDataViewState();
}

class _OneDataViewState extends State<OneDataView> {
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: FirebaseFirestore.instance.collection('Placement').doc('AWS').get(),
      builder: (BuildContext context, snapshot){
        data = snapshot!.data()!;
        return StudentData(data: data);
      }          
    );
  }
}