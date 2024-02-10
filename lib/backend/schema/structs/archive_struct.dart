// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArchiveStruct extends FFFirebaseStruct {
  ArchiveStruct({
    int? badgeCount,
    String? archiveName,
    DateTime? archiveDate,
    double? creditCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _badgeCount = badgeCount,
        _archiveName = archiveName,
        _archiveDate = archiveDate,
        _creditCount = creditCount,
        super(firestoreUtilData);

  // "BadgeCount" field.
  int? _badgeCount;
  int get badgeCount => _badgeCount ?? 0;
  set badgeCount(int? val) => _badgeCount = val;
  void incrementBadgeCount(int amount) => _badgeCount = badgeCount + amount;
  bool hasBadgeCount() => _badgeCount != null;

  // "ArchiveName" field.
  String? _archiveName;
  String get archiveName => _archiveName ?? '';
  set archiveName(String? val) => _archiveName = val;
  bool hasArchiveName() => _archiveName != null;

  // "ArchiveDate" field.
  DateTime? _archiveDate;
  DateTime? get archiveDate => _archiveDate;
  set archiveDate(DateTime? val) => _archiveDate = val;
  bool hasArchiveDate() => _archiveDate != null;

  // "CreditCount" field.
  double? _creditCount;
  double get creditCount => _creditCount ?? 0.0;
  set creditCount(double? val) => _creditCount = val;
  void incrementCreditCount(double amount) =>
      _creditCount = creditCount + amount;
  bool hasCreditCount() => _creditCount != null;

  static ArchiveStruct fromMap(Map<String, dynamic> data) => ArchiveStruct(
        badgeCount: castToType<int>(data['BadgeCount']),
        archiveName: data['ArchiveName'] as String?,
        archiveDate: data['ArchiveDate'] as DateTime?,
        creditCount: castToType<double>(data['CreditCount']),
      );

  static ArchiveStruct? maybeFromMap(dynamic data) =>
      data is Map ? ArchiveStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'BadgeCount': _badgeCount,
        'ArchiveName': _archiveName,
        'ArchiveDate': _archiveDate,
        'CreditCount': _creditCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'BadgeCount': serializeParam(
          _badgeCount,
          ParamType.int,
        ),
        'ArchiveName': serializeParam(
          _archiveName,
          ParamType.String,
        ),
        'ArchiveDate': serializeParam(
          _archiveDate,
          ParamType.DateTime,
        ),
        'CreditCount': serializeParam(
          _creditCount,
          ParamType.double,
        ),
      }.withoutNulls;

  static ArchiveStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArchiveStruct(
        badgeCount: deserializeParam(
          data['BadgeCount'],
          ParamType.int,
          false,
        ),
        archiveName: deserializeParam(
          data['ArchiveName'],
          ParamType.String,
          false,
        ),
        archiveDate: deserializeParam(
          data['ArchiveDate'],
          ParamType.DateTime,
          false,
        ),
        creditCount: deserializeParam(
          data['CreditCount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ArchiveStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArchiveStruct &&
        badgeCount == other.badgeCount &&
        archiveName == other.archiveName &&
        archiveDate == other.archiveDate &&
        creditCount == other.creditCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([badgeCount, archiveName, archiveDate, creditCount]);
}

ArchiveStruct createArchiveStruct({
  int? badgeCount,
  String? archiveName,
  DateTime? archiveDate,
  double? creditCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArchiveStruct(
      badgeCount: badgeCount,
      archiveName: archiveName,
      archiveDate: archiveDate,
      creditCount: creditCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArchiveStruct? updateArchiveStruct(
  ArchiveStruct? archive, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    archive
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArchiveStructData(
  Map<String, dynamic> firestoreData,
  ArchiveStruct? archive,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (archive == null) {
    return;
  }
  if (archive.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && archive.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final archiveData = getArchiveFirestoreData(archive, forFieldValue);
  final nestedData = archiveData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = archive.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArchiveFirestoreData(
  ArchiveStruct? archive, [
  bool forFieldValue = false,
]) {
  if (archive == null) {
    return {};
  }
  final firestoreData = mapToFirestore(archive.toMap());

  // Add any Firestore field values
  archive.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArchiveListFirestoreData(
  List<ArchiveStruct>? archives,
) =>
    archives?.map((e) => getArchiveFirestoreData(e, true)).toList() ?? [];
