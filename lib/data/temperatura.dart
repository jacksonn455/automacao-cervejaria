import 'package:cloud_firestore/cloud_firestore.dart';

class TemperaturetData {

  double situation;

  TemperaturetData.fromDocument(DocumentSnapshot snapshot){

    situation = snapshot.data["situation"];

  }

  Map<String, dynamic> toResumedMap(){
    return {
      "situation": situation
    };
  }

}