// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBadgeStruct extends FFFirebaseStruct {
  UserBadgeStruct({
    String? description,
    String? location,
    String? name,
    String? imageURL,
    String? badgeUID,
    DateTime? timeAdded,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _location = location,
        _name = name,
        _imageURL = imageURL,
        _badgeUID = badgeUID,
        _timeAdded = timeAdded,
        super(firestoreUtilData);

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

  // "ImageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;
  bool hasImageURL() => _imageURL != null;

  // "BadgeUID" field.
  String? _badgeUID;
  String get badgeUID => _badgeUID ?? '';
  set badgeUID(String? val) => _badgeUID = val;
  bool hasBadgeUID() => _badgeUID != null;

  // "TimeAdded" field.
  DateTime? _timeAdded;
  DateTime? get timeAdded => _timeAdded;
  set timeAdded(DateTime? val) => _timeAdded = val;
  bool hasTimeAdded() => _timeAdded != null;

  static UserBadgeStruct fromMap(Map<String, dynamic> data) => UserBadgeStruct(
        description: data['Description'] as String?,
        location: data['Location'] as String?,
        name: data['Name'] as String?,
        imageURL: data['ImageURL'] as String?,
        badgeUID: data['BadgeUID'] as String?,
        timeAdded: data['TimeAdded'] as DateTime?,
      );

  static UserBadgeStruct? maybeFromMap(dynamic data) => data is Map
      ? UserBadgeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Description': _description,
        'Location': _location,
        'Name': _name,
        'ImageURL': _imageURL,
        'BadgeUID': _badgeUID,
        'TimeAdded': _timeAdded,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
        'ImageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
        'BadgeUID': serializeParam(
          _badgeUID,
          ParamType.String,
        ),
        'TimeAdded': serializeParam(
          _timeAdded,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserBadgeStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserBadgeStruct(
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
        imageURL: deserializeParam(
          data['ImageURL'],
          ParamType.String,
          false,
        ),
        badgeUID: deserializeParam(
          data['BadgeUID'],
          ParamType.String,
          false,
        ),
        timeAdded: deserializeParam(
          data['TimeAdded'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'UserBadgeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserBadgeStruct &&
        description == other.description &&
        location == other.location &&
        name == other.name &&
        imageURL == other.imageURL &&
        badgeUID == other.badgeUID &&
        timeAdded == other.timeAdded;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([description, location, name, imageURL, badgeUID, timeAdded]);
}

UserBadgeStruct createUserBadgeStruct({
  String? description,
  String? location,
  String? name,
  String? imageURL,
  String? badgeUID,
  DateTime? timeAdded,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserBadgeStruct(
      description: description,
      location: location,
      name: name,
      imageURL: imageURL,
      badgeUID: badgeUID,
      timeAdded: timeAdded,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserBadgeStruct? updateUserBadgeStruct(
  UserBadgeStruct? userBadge, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userBadge
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserBadgeStructData(
  Map<String, dynamic> firestoreData,
  UserBadgeStruct? userBadge,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userBadge == null) {
    return;
  }
  if (userBadge.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userBadge.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userBadgeData = getUserBadgeFirestoreData(userBadge, forFieldValue);
  final nestedData = userBadgeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userBadge.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserBadgeFirestoreData(
  UserBadgeStruct? userBadge, [
  bool forFieldValue = false,
]) {
  if (userBadge == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userBadge.toMap());

  // Add any Firestore field values
  userBadge.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserBadgeListFirestoreData(
  List<UserBadgeStruct>? userBadges,
) =>
    userBadges?.map((e) => getUserBadgeFirestoreData(e, true)).toList() ?? [];
