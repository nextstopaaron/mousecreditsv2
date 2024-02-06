import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CreditDetailsRecord extends FirestoreRecord {
  CreditDetailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CreatedTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Credit" field.
  DocumentReference? _credit;
  DocumentReference? get credit => _credit;
  bool hasCredit() => _credit != null;

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['CreatedTime'] as DateTime?;
    _credit = snapshotData['Credit'] as DocumentReference?;
    _user = snapshotData['User'] as DocumentReference?;
    _image = snapshotData['Image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CreditDetails')
          : FirebaseFirestore.instance.collectionGroup('CreditDetails');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CreditDetails').doc(id);

  static Stream<CreditDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditDetailsRecord.fromSnapshot(s));

  static Future<CreditDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreditDetailsRecord.fromSnapshot(s));

  static CreditDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditDetailsRecordData({
  DateTime? createdTime,
  DocumentReference? credit,
  DocumentReference? user,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CreatedTime': createdTime,
      'Credit': credit,
      'User': user,
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditDetailsRecordDocumentEquality
    implements Equality<CreditDetailsRecord> {
  const CreditDetailsRecordDocumentEquality();

  @override
  bool equals(CreditDetailsRecord? e1, CreditDetailsRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.credit == e2?.credit &&
        e1?.user == e2?.user &&
        e1?.image == e2?.image;
  }

  @override
  int hash(CreditDetailsRecord? e) =>
      const ListEquality().hash([e?.createdTime, e?.credit, e?.user, e?.image]);

  @override
  bool isValidKey(Object? o) => o is CreditDetailsRecord;
}
