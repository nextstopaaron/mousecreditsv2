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

  // "BadgeCount" field.
  int? _badgeCount;
  int get badgeCount => _badgeCount ?? 0;
  bool hasBadgeCount() => _badgeCount != null;

  // "BadgeMap" field.
  List<BadgeStruct>? _badgeMap;
  List<BadgeStruct> get badgeMap => _badgeMap ?? const [];
  bool hasBadgeMap() => _badgeMap != null;

  void _initializeFields() {
    _badgeCount = castToType<int>(snapshotData['BadgeCount']);
    _badgeMap = getStructList(
      snapshotData['BadgeMap'],
      BadgeStruct.fromMap,
    );
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
  int? badgeCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'BadgeCount': badgeCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesRecordDocumentEquality implements Equality<BadgesRecord> {
  const BadgesRecordDocumentEquality();

  @override
  bool equals(BadgesRecord? e1, BadgesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.badgeCount == e2?.badgeCount &&
        listEquality.equals(e1?.badgeMap, e2?.badgeMap);
  }

  @override
  int hash(BadgesRecord? e) =>
      const ListEquality().hash([e?.badgeCount, e?.badgeMap]);

  @override
  bool isValidKey(Object? o) => o is BadgesRecord;
}
