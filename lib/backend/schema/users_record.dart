import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "CreditCount" field.
  int? _creditCount;
  int get creditCount => _creditCount ?? 0;
  bool hasCreditCount() => _creditCount != null;

  // "Credits" field.
  List<UserCreditStruct>? _credits;
  List<UserCreditStruct> get credits => _credits ?? const [];
  bool hasCredits() => _credits != null;

  // "Favorites" field.
  List<UserFavsStruct>? _favorites;
  List<UserFavsStruct> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "BadgeCount" field.
  int? _badgeCount;
  int get badgeCount => _badgeCount ?? 0;
  bool hasBadgeCount() => _badgeCount != null;

  // "FavoritesCount" field.
  int? _favoritesCount;
  int get favoritesCount => _favoritesCount ?? 0;
  bool hasFavoritesCount() => _favoritesCount != null;

  // "Badges" field.
  List<UserBadgeStruct>? _badges;
  List<UserBadgeStruct> get badges => _badges ?? const [];
  bool hasBadges() => _badges != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _creditCount = castToType<int>(snapshotData['CreditCount']);
    _credits = getStructList(
      snapshotData['Credits'],
      UserCreditStruct.fromMap,
    );
    _favorites = getStructList(
      snapshotData['Favorites'],
      UserFavsStruct.fromMap,
    );
    _badgeCount = castToType<int>(snapshotData['BadgeCount']);
    _favoritesCount = castToType<int>(snapshotData['FavoritesCount']);
    _badges = getStructList(
      snapshotData['Badges'],
      UserBadgeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? creditCount,
  int? badgeCount,
  int? favoritesCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'CreditCount': creditCount,
      'BadgeCount': badgeCount,
      'FavoritesCount': favoritesCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.creditCount == e2?.creditCount &&
        listEquality.equals(e1?.credits, e2?.credits) &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        e1?.badgeCount == e2?.badgeCount &&
        e1?.favoritesCount == e2?.favoritesCount &&
        listEquality.equals(e1?.badges, e2?.badges);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.creditCount,
        e?.credits,
        e?.favorites,
        e?.badgeCount,
        e?.favoritesCount,
        e?.badges
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
