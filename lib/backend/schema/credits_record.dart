import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditsRecord extends FirestoreRecord {
  CreditsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "Sub_location" field.
  String? _subLocation;
  String get subLocation => _subLocation ?? '';
  bool hasSubLocation() => _subLocation != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "Favorites" field.
  List<DocumentReference>? _favorites;
  List<DocumentReference> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "Badges" field.
  List<DocumentReference>? _badges;
  List<DocumentReference> get badges => _badges ?? const [];
  bool hasBadges() => _badges != null;

  // "Popularity" field.
  int? _popularity;
  int get popularity => _popularity ?? 0;
  bool hasPopularity() => _popularity != null;

  // "CreatedTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _location = snapshotData['Location'] as String?;
    _subLocation = snapshotData['Sub_location'] as String?;
    _type = snapshotData['Type'] as String?;
    _users = getDataList(snapshotData['Users']);
    _favorites = getDataList(snapshotData['Favorites']);
    _badges = getDataList(snapshotData['Badges']);
    _popularity = castToType<int>(snapshotData['Popularity']);
    _createdTime = snapshotData['CreatedTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Credits');

  static Stream<CreditsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditsRecord.fromSnapshot(s));

  static Future<CreditsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreditsRecord.fromSnapshot(s));

  static CreditsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditsRecordData({
  String? name,
  String? location,
  String? subLocation,
  String? type,
  int? popularity,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Location': location,
      'Sub_location': subLocation,
      'Type': type,
      'Popularity': popularity,
      'CreatedTime': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditsRecordDocumentEquality implements Equality<CreditsRecord> {
  const CreditsRecordDocumentEquality();

  @override
  bool equals(CreditsRecord? e1, CreditsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.subLocation == e2?.subLocation &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        listEquality.equals(e1?.badges, e2?.badges) &&
        e1?.popularity == e2?.popularity &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(CreditsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.subLocation,
        e?.type,
        e?.users,
        e?.favorites,
        e?.badges,
        e?.popularity,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is CreditsRecord;
}
