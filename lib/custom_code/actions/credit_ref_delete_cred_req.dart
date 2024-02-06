// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future creditRefDeleteCredReq(DocumentReference credit) async {
  final instance = FirebaseFirestore.instance;
  final batch = instance.batch();
  var collection = instance.collection('Badges');
  var snapshots =
      await collection.where("CredReq", arrayContains: credit).get();
  for (var doc in snapshots.docs) {
    batch.update(doc.reference, {
      "CredReq": FieldValue.arrayRemove([credit])
    });
  }
  await batch.commit();
}
