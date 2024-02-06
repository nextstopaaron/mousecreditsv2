// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgeStruct extends FFFirebaseStruct {
  BadgeStruct({
    List<String>? credReq,
    String? description,
    String? location,
    String? name,
    String? uid,
    DateTime? createdDate,
    String? imageURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _credReq = credReq,
        _description = description,
        _location = location,
        _name = name,
        _uid = uid,
        _createdDate = createdDate,
        _imageURL = imageURL,
        super(firestoreUtilData);

  // "CredReq" field.
  List<String>? _credReq;
  List<String> get credReq => _credReq ?? const [];
  set credReq(List<String>? val) => _credReq = val;
  void updateCredReq(Function(List<String>) updateFn) =>
      updateFn(_credReq ??= []);
  bool hasCredReq() => _credReq != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  set createdDate(DateTime? val) => _createdDate = val;
  bool hasCreatedDate() => _createdDate != null;

  // "ImageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;
  bool hasImageURL() => _imageURL != null;

  static BadgeStruct fromMap(Map<String, dynamic> data) => BadgeStruct(
        credReq: getDataList(data['CredReq']),
        description: data['Description'] as String?,
        location: data['Location'] as String?,
        name: data['Name'] as String?,
        uid: data['UID'] as String?,
        createdDate: data['CreatedDate'] as DateTime?,
        imageURL: data['ImageURL'] as String?,
      );

  static BadgeStruct? maybeFromMap(dynamic data) =>
      data is Map ? BadgeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'CredReq': _credReq,
        'Description': _description,
        'Location': _location,
        'Name': _name,
        'UID': _uid,
        'CreatedDate': _createdDate,
        'ImageURL': _imageURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CredReq': serializeParam(
          _credReq,
          ParamType.String,
          true,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'UID': serializeParam(
          _uid,
          ParamType.String,
        ),
        'CreatedDate': serializeParam(
          _createdDate,
          ParamType.DateTime,
        ),
        'ImageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static BadgeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BadgeStruct(
        credReq: deserializeParam<String>(
          data['CredReq'],
          ParamType.String,
          true,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['UID'],
          ParamType.String,
          false,
        ),
        createdDate: deserializeParam(
          data['CreatedDate'],
          ParamType.DateTime,
          false,
        ),
        imageURL: deserializeParam(
          data['ImageURL'],
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
        listEquality.equals(credReq, other.credReq) &&
        description == other.description &&
        location == other.location &&
        name == other.name &&
        uid == other.uid &&
        createdDate == other.createdDate &&
        imageURL == other.imageURL;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([credReq, description, location, name, uid, createdDate, imageURL]);
}

BadgeStruct createBadgeStruct({
  String? description,
  String? location,
  String? name,
  String? uid,
  DateTime? createdDate,
  String? imageURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BadgeStruct(
      description: description,
      location: location,
      name: name,
      uid: uid,
      createdDate: createdDate,
      imageURL: imageURL,
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
