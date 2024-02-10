import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditsRecord extends FirestoreRecord {
  CreditsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CreditCount" field.
  int? _creditCount;
  int get creditCount => _creditCount ?? 0;
  bool hasCreditCount() => _creditCount != null;

  // "CreditMap" field.
  List<CreditStruct>? _creditMap;
  List<CreditStruct> get creditMap => _creditMap ?? const [];
  bool hasCreditMap() => _creditMap != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _creditCount = castToType<int>(snapshotData['CreditCount']);
    _creditMap = getStructList(
      snapshotData['CreditMap'],
      CreditStruct.fromMap,
    );
    _location = snapshotData['Location'] as String?;
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
  int? creditCount,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CreditCount': creditCount,
      'Location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditsRecordDocumentEquality implements Equality<CreditsRecord> {
  const CreditsRecordDocumentEquality();

  @override
  bool equals(CreditsRecord? e1, CreditsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creditCount == e2?.creditCount &&
        listEquality.equals(e1?.creditMap, e2?.creditMap) &&
        e1?.location == e2?.location;
  }

  @override
  int hash(CreditsRecord? e) =>
      const ListEquality().hash([e?.creditCount, e?.creditMap, e?.location]);

  @override
  bool isValidKey(Object? o) => o is CreditsRecord;
}
