import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditsTestingRecord extends FirestoreRecord {
  CreditsTestingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CreditFieldTest" field.
  List<CreditStruct>? _creditFieldTest;
  List<CreditStruct> get creditFieldTest => _creditFieldTest ?? const [];
  bool hasCreditFieldTest() => _creditFieldTest != null;

  // "CreditCount" field.
  int? _creditCount;
  int get creditCount => _creditCount ?? 0;
  bool hasCreditCount() => _creditCount != null;

  void _initializeFields() {
    _creditFieldTest = getStructList(
      snapshotData['CreditFieldTest'],
      CreditStruct.fromMap,
    );
    _creditCount = castToType<int>(snapshotData['CreditCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CreditsTesting');

  static Stream<CreditsTestingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditsTestingRecord.fromSnapshot(s));

  static Future<CreditsTestingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreditsTestingRecord.fromSnapshot(s));

  static CreditsTestingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditsTestingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditsTestingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditsTestingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditsTestingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditsTestingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditsTestingRecordData({
  int? creditCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CreditCount': creditCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditsTestingRecordDocumentEquality
    implements Equality<CreditsTestingRecord> {
  const CreditsTestingRecordDocumentEquality();

  @override
  bool equals(CreditsTestingRecord? e1, CreditsTestingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.creditFieldTest, e2?.creditFieldTest) &&
        e1?.creditCount == e2?.creditCount;
  }

  @override
  int hash(CreditsTestingRecord? e) =>
      const ListEquality().hash([e?.creditFieldTest, e?.creditCount]);

  @override
  bool isValidKey(Object? o) => o is CreditsTestingRecord;
}
