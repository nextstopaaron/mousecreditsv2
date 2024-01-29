import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TypesRecord extends FirestoreRecord {
  TypesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _type = snapshotData['Type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Types');

  static Stream<TypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TypesRecord.fromSnapshot(s));

  static Future<TypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TypesRecord.fromSnapshot(s));

  static TypesRecord fromSnapshot(DocumentSnapshot snapshot) => TypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTypesRecordData({
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class TypesRecordDocumentEquality implements Equality<TypesRecord> {
  const TypesRecordDocumentEquality();

  @override
  bool equals(TypesRecord? e1, TypesRecord? e2) {
    return e1?.type == e2?.type;
  }

  @override
  int hash(TypesRecord? e) => const ListEquality().hash([e?.type]);

  @override
  bool isValidKey(Object? o) => o is TypesRecord;
}
