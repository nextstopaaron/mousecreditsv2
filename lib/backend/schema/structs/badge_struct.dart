// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgeStruct extends FFFirebaseStruct {
  BadgeStruct({
    String? description,
    String? name,
    List<String>? credReq,
    String? location,
    String? imageURL,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _name = name,
        _credReq = credReq,
        _location = location,
        _imageURL = imageURL,
        _uid = uid,
        super(firestoreUtilData);

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "CredReq" field.
  List<String>? _credReq;
  List<String> get credReq => _credReq ?? const [];
  set credReq(List<String>? val) => _credReq = val;
  void updateCredReq(Function(List<String>) updateFn) =>
      updateFn(_credReq ??= []);
  bool hasCredReq() => _credReq != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "ImageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;
  bool hasImageURL() => _imageURL != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  static BadgeStruct fromMap(Map<String, dynamic> data) => BadgeStruct(
        description: data['Description'] as String?,
        name: data['Name'] as String?,
        credReq: getDataList(data['CredReq']),
        location: data['Location'] as String?,
        imageURL: data['ImageURL'] as String?,
        uid: data['UID'] as String?,
      );

  static BadgeStruct? maybeFromMap(dynamic data) =>
      data is Map ? BadgeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Description': _description,
        'Name': _name,
        'CredReq': _credReq,
        'Location': _location,
        'ImageURL': _imageURL,
        'UID': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'CredReq': serializeParam(
          _credReq,
          ParamType.String,
          true,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'ImageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
        'UID': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static BadgeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BadgeStruct(
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        credReq: deserializeParam<String>(
          data['CredReq'],
          ParamType.String,
          true,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        imageURL: deserializeParam(
          data['ImageURL'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['UID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BadgeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BadgeStruct &&
        description == other.description &&
        name == other.name &&
        listEquality.equals(credReq, other.credReq) &&
        location == other.location &&
        imageURL == other.imageURL &&
        uid == other.uid;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([description, name, credReq, location, imageURL, uid]);
}

BadgeStruct createBadgeStruct({
  String? description,
  String? name,
  String? location,
  String? imageURL,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BadgeStruct(
      description: description,
      name: name,
      location: location,
      imageURL: imageURL,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BadgeStruct? updateBadgeStruct(
  BadgeStruct? badge, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    badge
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBadgeStructData(
  Map<String, dynamic> firestoreData,
  BadgeStruct? badge,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (badge == null) {
    return;
  }
  if (badge.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && badge.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final badgeData = getBadgeFirestoreData(badge, forFieldValue);
  final nestedData = badgeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = badge.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBadgeFirestoreData(
  BadgeStruct? badge, [
  bool forFieldValue = false,
]) {
  if (badge == null) {
    return {};
  }
  final firestoreData = mapToFirestore(badge.toMap());

  // Add any Firestore field values
  badge.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBadgeListFirestoreData(
  List<BadgeStruct>? badges,
) =>
    badges?.map((e) => getBadgeFirestoreData(e, true)).toList() ?? [];
