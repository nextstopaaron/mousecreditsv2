import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgesRecord extends FirestoreRecord {
  BadgesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "CredReq" field.
  List<DocumentReference>? _credReq;
  List<DocumentReference> get credReq => _credReq ?? const [];
  bool hasCredReq() => _credReq != null;

  // "Popularity" field.
  int? _popularity;
  int get popularity => _popularity ?? 0;
  bool hasPopularity() => _popularity != null;

  // "Challenge" field.
  String? _challenge;
  String get challenge => _challenge ?? '';
  bool hasChallenge() => _challenge != null;

  // "CreatedTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
    _users = getDataList(snapshotData['Users']);
    _credReq = getDataList(snapshotData['CredReq']);
    _popularity = castToType<int>(snapshotData['Popularity']);
    _challenge = snapshotData['Challenge'] as String?;
    _createdTime = snapshotData['CreatedTime'] as DateTime?;
    _location = snapshotData['Location'] as String?;
    _image = snapshotData['Image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Badges');

  static Stream<BadgesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BadgesRecord.fromSnapshot(s));

  static Future<BadgesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BadgesRecord.fromSnapshot(s));

  static BadgesRecord fromSnapshot(DocumentSnapshot snapshot) => BadgesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BadgesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BadgesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BadgesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BadgesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBadgesRecordData({
  String? name,
  String? description,
  int? popularity,
  String? challenge,
  DateTime? createdTime,
  String? location,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Description': description,
      'Popularity': popularity,
      'Challenge': challenge,
      'CreatedTime': createdTime,
      'Location': location,
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesRecordDocumentEquality implements Equality<BadgesRecord> {
  const BadgesRecordDocumentEquality();

  @override
  bool equals(BadgesRecord? e1, BadgesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.credReq, e2?.credReq) &&
        e1?.popularity == e2?.popularity &&
        e1?.challenge == e2?.challenge &&
        e1?.createdTime == e2?.createdTime &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image;
  }

  @override
  int hash(BadgesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.users,
        e?.credReq,
        e?.popularity,
        e?.challenge,
        e?.createdTime,
        e?.location,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is BadgesRecord;
}
