// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditStruct extends FFFirebaseStruct {
  CreditStruct({
    String? name,
    String? location,
    DateTime? timeCreated,
    String? uid,
    String? type,
    String? imageURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _location = location,
        _timeCreated = timeCreated,
        _uid = uid,
        _type = type,
        _imageURL = imageURL,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "TimeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  set timeCreated(DateTime? val) => _timeCreated = val;
  bool hasTimeCreated() => _timeCreated != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "ImageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;
  bool hasImageURL() => _imageURL != null;

  static CreditStruct fromMap(Map<String, dynamic> data) => CreditStruct(
        name: data['Name'] as String?,
        location: data['Location'] as String?,
        timeCreated: data['TimeCreated'] as DateTime?,
        uid: data['UID'] as String?,
        type: data['Type'] as String?,
        imageURL: data['ImageURL'] as String?,
      );

  static CreditStruct? maybeFromMap(dynamic data) =>
      data is Map ? CreditStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Location': _location,
        'TimeCreated': _timeCreated,
        'UID': _uid,
        'Type': _type,
        'ImageURL': _imageURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'TimeCreated': serializeParam(
          _timeCreated,
          ParamType.DateTime,
        ),
        'UID': serializeParam(
          _uid,
          ParamType.String,
        ),
        'Type': serializeParam(
          _type,
          ParamType.String,
        ),
        'ImageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreditStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreditStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        timeCreated: deserializeParam(
          data['TimeCreated'],
          ParamType.DateTime,
          false,
        ),
        uid: deserializeParam(
          data['UID'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['Type'],
          ParamType.String,
          false,
        ),
        imageURL: deserializeParam(
          data['ImageURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreditStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreditStruct &&
        name == other.name &&
        location == other.location &&
        timeCreated == other.timeCreated &&
        uid == other.uid &&
        type == other.type &&
        imageURL == other.imageURL;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, location, timeCreated, uid, type, imageURL]);
}

CreditStruct createCreditStruct({
  String? name,
  String? location,
  DateTime? timeCreated,
  String? uid,
  String? type,
  String? imageURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreditStruct(
      name: name,
      location: location,
      timeCreated: timeCreated,
      uid: uid,
      type: type,
      imageURL: imageURL,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreditStruct? updateCreditStruct(
  CreditStruct? credit, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    credit
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreditStructData(
  Map<String, dynamic> firestoreData,
  CreditStruct? credit,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (credit == null) {
    return;
  }
  if (credit.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && credit.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creditData = getCreditFirestoreData(credit, forFieldValue);
  final nestedData = creditData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = credit.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreditFirestoreData(
  CreditStruct? credit, [
  bool forFieldValue = false,
]) {
  if (credit == null) {
    return {};
  }
  final firestoreData = mapToFirestore(credit.toMap());

  // Add any Firestore field values
  credit.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreditListFirestoreData(
  List<CreditStruct>? credits,
) =>
    credits?.map((e) => getCreditFirestoreData(e, true)).toList() ?? [];
