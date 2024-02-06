import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List<String> _CreditLocalQuery = [];
  List<String> get CreditLocalQuery => _CreditLocalQuery;
  set CreditLocalQuery(List<String> value) {
    _CreditLocalQuery = value;
  }

  void addToCreditLocalQuery(String value) {
    _CreditLocalQuery.add(value);
  }

  void removeFromCreditLocalQuery(String value) {
    _CreditLocalQuery.remove(value);
  }

  void removeAtIndexFromCreditLocalQuery(int index) {
    _CreditLocalQuery.removeAt(index);
  }

  void updateCreditLocalQueryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _CreditLocalQuery[index] = updateFn(_CreditLocalQuery[index]);
  }

  void insertAtIndexInCreditLocalQuery(int index, String value) {
    _CreditLocalQuery.insert(index, value);
  }

  final _creditMasterManager = FutureRequestManager<List<CreditsRecord>>();
  Future<List<CreditsRecord>> creditMaster({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CreditsRecord>> Function() requestFn,
  }) =>
      _creditMasterManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCreditMasterCache() => _creditMasterManager.clear();
  void clearCreditMasterCacheKey(String? uniqueKey) =>
      _creditMasterManager.clearRequest(uniqueKey);

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

  final _creditMasterSingleManager =
      StreamRequestManager<List<CreditsRecord>>();
  Stream<List<CreditsRecord>> creditMasterSingle({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CreditsRecord>> Function() requestFn,
  }) =>
      _creditMasterSingleManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCreditMasterSingleCache() => _creditMasterSingleManager.clear();
  void clearCreditMasterSingleCacheKey(String? uniqueKey) =>
      _creditMasterSingleManager.clearRequest(uniqueKey);

  final _locationsManager = StreamRequestManager<List<LocationsRecord>>();
  Stream<List<LocationsRecord>> locations({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<LocationsRecord>> Function() requestFn,
  }) =>
      _locationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLocationsCache() => _locationsManager.clear();
  void clearLocationsCacheKey(String? uniqueKey) =>
      _locationsManager.clearRequest(uniqueKey);

  final _badgesManager = StreamRequestManager<List<BadgesRecord>>();
  Stream<List<BadgesRecord>> badges({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BadgesRecord>> Function() requestFn,
  }) =>
      _badgesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBadgesCache() => _badgesManager.clear();
  void clearBadgesCacheKey(String? uniqueKey) =>
      _badgesManager.clearRequest(uniqueKey);

  final _typesManager = StreamRequestManager<List<TypesRecord>>();
  Stream<List<TypesRecord>> types({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TypesRecord>> Function() requestFn,
  }) =>
      _typesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTypesCache() => _typesManager.clear();
  void clearTypesCacheKey(String? uniqueKey) =>
      _typesManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
