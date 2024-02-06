import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefreshRecord extends FirestoreRecord {
  RefreshRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Blank" field.
  int? _blank;
  int get blank => _blank ?? 0;
  bool hasBlank() => _blank != null;

  void _initializeFields() {
    _blank = castToType<int>(snapshotData['Blank']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Refresh');

  static Stream<RefreshRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefreshRecord.fromSnapshot(s));

  static Future<RefreshRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefreshRecord.fromSnapshot(s));

  static RefreshRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefreshRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefreshRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefreshRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefreshRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefreshRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefreshRecordData({
  int? blank,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Blank': blank,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefreshRecordDocumentEquality implements Equality<RefreshRecord> {
  const RefreshRecordDocumentEquality();

  @override
  bool equals(RefreshRecord? e1, RefreshRecord? e2) {
    return e1?.blank == e2?.blank;
  }

  @override
  int hash(RefreshRecord? e) => const ListEquality().hash([e?.blank]);

  @override
  bool isValidKey(Object? o) => o is RefreshRecord;
}
