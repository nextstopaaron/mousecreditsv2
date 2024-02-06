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

Future<int?> creditCount() async {
  // count number of items in firestore document array map CreditFieldTest
// Assuming the Firestore collection is named "creditFieldTests" and the document ID is "testDocument"

  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance
          .collection('CreditsTesting')
          .doc('2KpTuSHy6GOqpWNlposp')
          .get();

  final List<dynamic>? creditFields = snapshot.data()?['CreditFieldTest'];

  if (creditFields != null) {
    return creditFields.length;
  } else {
    return 0;
  }
}
