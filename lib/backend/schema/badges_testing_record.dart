import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgesTestingRecord extends FirestoreRecord {
  BadgesTestingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "BadgeFieldTest" field.
  List<BadgeStruct>? _badgeFieldTest;
  List<BadgeStruct> get badgeFieldTest => _badgeFieldTest ?? const [];
  bool hasBadgeFieldTest() => _badgeFieldTest != null;

  // "BadgeCount" field.
  int? _badgeCount;
  int get badgeCount => _badgeCount ?? 0;
  bool hasBadgeCount() => _badgeCount != null;

  void _initializeFields() {
    _badgeFieldTest = getStructList(
      snapshotData['BadgeFieldTest'],
      BadgeStruct.fromMap,
    );
    _badgeCount = castToType<int>(snapshotData['BadgeCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BadgesTesting');

  static Stream<BadgesTestingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BadgesTestingRecord.fromSnapshot(s));

  static Future<BadgesTestingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BadgesTestingRecord.fromSnapshot(s));

  static BadgesTestingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BadgesTestingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BadgesTestingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BadgesTestingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BadgesTestingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BadgesTestingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBadgesTestingRecordData({
  int? badgeCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'BadgeCount': badgeCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesTestingRecordDocumentEquality
    implements Equality<BadgesTestingRecord> {
  const BadgesTestingRecordDocumentEquality();

  @override
  bool equals(BadgesTestingRecord? e1, BadgesTestingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.badgeFieldTest, e2?.badgeFieldTest) &&
        e1?.badgeCount == e2?.badgeCount;
  }

  @override
  int hash(BadgesTestingRecord? e) =>
      const ListEquality().hash([e?.badgeFieldTest, e?.badgeCount]);

  @override
  bool isValidKey(Object? o) => o is BadgesTestingRecord;
}
