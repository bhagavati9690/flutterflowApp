import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "isVenue" field.
  bool? _isVenue;
  bool get isVenue => _isVenue ?? false;
  bool hasIsVenue() => _isVenue != null;

  // "isRental" field.
  bool? _isRental;
  bool get isRental => _isRental ?? false;
  bool hasIsRental() => _isRental != null;

  // "isEntertainer" field.
  bool? _isEntertainer;
  bool get isEntertainer => _isEntertainer ?? false;
  bool hasIsEntertainer() => _isEntertainer != null;

  // "isCake" field.
  bool? _isCake;
  bool get isCake => _isCake ?? false;
  bool hasIsCake() => _isCake != null;

  // "isFood" field.
  bool? _isFood;
  bool get isFood => _isFood ?? false;
  bool hasIsFood() => _isFood != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _isVenue = snapshotData['isVenue'] as bool?;
    _isRental = snapshotData['isRental'] as bool?;
    _isEntertainer = snapshotData['isEntertainer'] as bool?;
    _isCake = snapshotData['isCake'] as bool?;
    _isFood = snapshotData['isFood'] as bool?;
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
  bool? isVenue,
  bool? isRental,
  bool? isEntertainer,
  bool? isCake,
  bool? isFood,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'isVenue': isVenue,
      'isRental': isRental,
      'isEntertainer': isEntertainer,
      'isCake': isCake,
      'isFood': isFood,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.isVenue == e2?.isVenue &&
        e1?.isRental == e2?.isRental &&
        e1?.isEntertainer == e2?.isEntertainer &&
        e1?.isCake == e2?.isCake &&
        e1?.isFood == e2?.isFood;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.isVenue,
        e?.isRental,
        e?.isEntertainer,
        e?.isCake,
        e?.isFood
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
