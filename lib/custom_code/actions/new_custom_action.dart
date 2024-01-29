// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> newCustomAction() async {
  // get the last document added to collection "Credits"
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('Credits')
      .orderBy('Users', descending: true)
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    final DocumentSnapshot lastDocument = querySnapshot.docs.first;
    final Map<String, dynamic> data =
        lastDocument.data() as Map<String, dynamic>;
    final String? lastCredit = data['credit'] as String?;
    print(lastCredit);
    return lastCredit;
  }
  return null;
}
