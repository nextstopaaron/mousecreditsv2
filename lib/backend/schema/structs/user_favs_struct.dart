// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFavsStruct extends FFFirebaseStruct {
  UserFavsStruct({
    String? name,
    String? location,
    DateTime? timeAdded,
    String? creditUID,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _location = location,
        _timeAdded = timeAdded,
        _creditUID = creditUID,
        _type = type,
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

  // "TimeAdded" field.
  DateTime? _timeAdded;
  DateTime? get timeAdded => _timeAdded;
  set timeAdded(DateTime? val) => _timeAdded = val;
  bool hasTimeAdded() => _timeAdded != null;

  // "CreditUID" field.
  String? _creditUID;
  String get creditUID => _creditUID ?? '';
  set creditUID(String? val) => _creditUID = val;
  bool hasCreditUID() => _creditUID != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static UserFavsStruct fromMap(Map<String, dynamic> data) => UserFavsStruct(
        name: data['Name'] as String?,
        location: data['Location'] as String?,
        timeAdded: data['TimeAdded'] as DateTime?,
        creditUID: data['CreditUID'] as String?,
        type: data['Type'] as String?,
      );

  static UserFavsStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserFavsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Location': _location,
        'TimeAdded': _timeAdded,
        'CreditUID': _creditUID,
        'Type': _type,
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
        'TimeAdded': serializeParam(
          _timeAdded,
          ParamType.DateTime,
        ),
        'CreditUID': serializeParam(
          _creditUID,
          ParamType.String,
        ),
        'Type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserFavsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserFavsStruct(
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
        timeAdded: deserializeParam(
          data['TimeAdded'],
          ParamType.DateTime,
          false,
        ),
        creditUID: deserializeParam(
          data['CreditUID'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['Type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserFavsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserFavsStruct &&
        name == other.name &&
        location == other.location &&
        timeAdded == other.timeAdded &&
        creditUID == other.creditUID &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, location, timeAdded, creditUID, type]);
}

UserFavsStruct createUserFavsStruct({
  String? name,
  String? location,
  DateTime? timeAdded,
  String? creditUID,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserFavsStruct(
      name: name,
      location: location,
      timeAdded: timeAdded,
      creditUID: creditUID,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserFavsStruct? updateUserFavsStruct(
  UserFavsStruct? userFavs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userFavs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserFavsStructData(
  Map<String, dynamic> firestoreData,
  UserFavsStruct? userFavs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userFavs == null) {
    return;
  }
  if (userFavs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userFavs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userFavsData = getUserFavsFirestoreData(userFavs, forFieldValue);
  final nestedData = userFavsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userFavs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFavsFirestoreData(
  UserFavsStruct? userFavs, [
  bool forFieldValue = false,
]) {
  if (userFavs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userFavs.toMap());

  // Add any Firestore field values
  userFavs.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserFavsListFirestoreData(
  List<UserFavsStruct>? userFavss,
) =>
    userFavss?.map((e) => getUserFavsFirestoreData(e, true)).toList() ?? [];
