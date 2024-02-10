import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _FirstTimeUser = prefs.getBool('ff_FirstTimeUser') ?? _FirstTimeUser;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _Searchview = 'Initialview';
  String get Searchview => _Searchview;
  set Searchview(String value) {
    _Searchview = value;
  }

  String _Viewtoggle = '';
  String get Viewtoggle => _Viewtoggle;
  set Viewtoggle(String value) {
    _Viewtoggle = value;
  }

  bool _FirstTimeUser = true;
  bool get FirstTimeUser => _FirstTimeUser;
  set FirstTimeUser(bool value) {
    _FirstTimeUser = value;
    prefs.setBool('ff_FirstTimeUser', value);
  }

  String _Viewparameter = 'Credits';
  String get Viewparameter => _Viewparameter;
  set Viewparameter(String value) {
    _Viewparameter = value;
  }

  int _Creditcount = 0;
  int get Creditcount => _Creditcount;
  set Creditcount(int value) {
    _Creditcount = value;
  }

  String _CreditShow = '';
  String get CreditShow => _CreditShow;
  set CreditShow(String value) {
    _CreditShow = value;
  }

  String _BadgeShow = '';
  String get BadgeShow => _BadgeShow;
  set BadgeShow(String value) {
    _BadgeShow = value;
  }

  DocumentReference? _CreditDocRef =
      FirebaseFirestore.instance.doc('/Credits/9e8IZH0GImDeZ2KczkCT');
  DocumentReference? get CreditDocRef => _CreditDocRef;
  set CreditDocRef(DocumentReference? value) {
    _CreditDocRef = value;
  }

  DocumentReference? _BadgeDocRef =
      FirebaseFirestore.instance.doc('/Badges/ISMg6EKc0US0bOY6PONp');
  DocumentReference? get BadgeDocRef => _BadgeDocRef;
  set BadgeDocRef(DocumentReference? value) {
    _BadgeDocRef = value;
  }

  final _creditCountManager = FutureRequestManager<int>();
  Future<int> creditCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _creditCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCreditCountCache() => _creditCountManager.clear();
  void clearCreditCountCacheKey(String? uniqueKey) =>
      _creditCountManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
