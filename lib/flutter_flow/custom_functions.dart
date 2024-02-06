import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? calPercentage(
  double? credsearned,
  double? credsavailable,
) {
  // calculate percentage using two values
  if (credsearned == null || credsavailable == null || credsavailable == 0) {
    return null;
  }
  return (credsearned / credsavailable);
}

String? credStatus(
  double? credsearned,
  double? credsavailable,
) {
  // calculate percentage of two values, if value is less than .25 return "Rookie"
  if (credsearned == null || credsavailable == null || credsavailable == 0) {
    return null;
  }
  double percentage = credsearned / credsavailable;
  if (percentage >= 0.01 && percentage <= 0.25) {
    return "Rookie";
  } else if (percentage >= 0.26 && percentage <= 0.50) {
    return "Novice";
  } else if (percentage >= 0.51 && percentage <= 1) {
    return "Pro";
  } else {
    return null;
  }
}

bool? arraycheck(
  List<String>? array1,
  List<String>? array2,
) {
  // see if one array contains all items in another array
  if (array1 == null || array2 == null) {
    return null;
  }
  for (final item in array2) {
    if (!array1.contains(item)) {
      return false;
    }
  }
  return true;
}

bool? strCheck(
  String? string1,
  String? string2,
) {
  // See if string1 contains text in string2
  if (string1 == null || string2 == null) {
    return null;
  }
  return string1.toLowerCase().contains(string2.toLowerCase());
}
