// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCreditStruct extends FFFirebaseStruct {
  UserCreditStruct({
    String? name,
    String? location,
    DateTime? timeAdded,
    String? creditUID,
    String? type,
    String? imageURL,
    double? waitTime,
    double? rating,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _location = location,
        _timeAdded = timeAdded,
        _creditUID = creditUID,
        _type = type,
        _imageURL = imageURL,
        _waitTime = waitTime,
        _rating = rating,
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

  // "ImageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;
  bool hasImageURL() => _imageURL != null;

  // "WaitTime" field.
  double? _waitTime;
  double get waitTime => _waitTime ?? 0.0;
  set waitTime(double? val) => _waitTime = val;
  void incrementWaitTime(double amount) => _waitTime = waitTime + amount;
  bool hasWaitTime() => _waitTime != null;

  // "Rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;
  void incrementRating(double amount) => _rating = rating + amount;
  bool hasRating() => _rating != null;

  static UserCreditStruct fromMap(Map<String, dynamic> data) =>
      UserCreditStruct(
        name: data['Name'] as String?,
        location: data['Location'] as String?,
        timeAdded: data['TimeAdded'] as DateTime?,
        creditUID: data['CreditUID'] as String?,
        type: data['Type'] as String?,
        imageURL: data['ImageURL'] as String?,
        waitTime: castToType<double>(data['WaitTime']),
        rating: castToType<double>(data['Rating']),
      );

  static UserCreditStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCreditStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Location': _location,
        'TimeAdded': _timeAdded,
        'CreditUID': _creditUID,
        'Type': _type,
        'ImageURL': _imageURL,
        'WaitTime': _waitTime,
        'Rating': _rating,
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
        'ImageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
        'WaitTime': serializeParam(
          _waitTime,
          ParamType.double,
        ),
        'Rating': serializeParam(
          _rating,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserCreditStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserCreditStruct(
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
        imageURL: deserializeParam(
          data['ImageURL'],
          ParamType.String,
          false,
        ),
        waitTime: deserializeParam(
          data['WaitTime'],
          ParamType.double,
          false,
        ),
        rating: deserializeParam(
          data['Rating'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UserCreditStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCreditStruct &&
        name == other.name &&
        location == other.location &&
        timeAdded == other.timeAdded &&
        creditUID == other.creditUID &&
        type == other.type &&
        imageURL == other.imageURL &&
        waitTime == other.waitTime &&
        rating == other.rating;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, location, timeAdded, creditUID, type, imageURL, waitTime, rating]);
}

UserCreditStruct createUserCreditStruct({
  String? name,
  String? location,
  DateTime? timeAdded,
  String? creditUID,
  String? type,
  String? imageURL,
  double? waitTime,
  double? rating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCreditStruct(
      name: name,
      location: location,
      timeAdded: timeAdded,
      creditUID: creditUID,
      type: type,
      imageURL: imageURL,
      waitTime: waitTime,
      rating: rating,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCreditStruct? updateUserCreditStruct(
  UserCreditStruct? userCredit, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCredit
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCreditStructData(
  Map<String, dynamic> firestoreData,
  UserCreditStruct? userCredit,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCredit == null) {
    return;
  }
  if (userCredit.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userCredit.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCreditData = getUserCreditFirestoreData(userCredit, forFieldValue);
  final nestedData = userCreditData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userCredit.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCreditFirestoreData(
  UserCreditStruct? userCredit, [
  bool forFieldValue = false,
]) {
  if (userCredit == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCredit.toMap());

  // Add any Firestore field values
  userCredit.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCreditListFirestoreData(
  List<UserCreditStruct>? userCredits,
) =>
    userCredits?.map((e) => getUserCreditFirestoreData(e, true)).toList() ?? [];
