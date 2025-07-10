import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userIds" field.
  List<DocumentReference>? _userIds;
  List<DocumentReference> get userIds => _userIds ?? const [];
  bool hasUserIds() => _userIds != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "userNames" field.
  List<String>? _userNames;
  List<String> get userNames => _userNames ?? const [];
  bool hasUserNames() => _userNames != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "lastMessageSeenBy" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  void _initializeFields() {
    _userIds = getDataList(snapshotData['userIds']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _userNames = getDataList(snapshotData['userNames']);
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _lastMessageSeenBy = getDataList(snapshotData['lastMessageSeenBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? lastMessage,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'timeStamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userIds, e2?.userIds) &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.userNames, e2?.userNames) &&
        e1?.timeStamp == e2?.timeStamp &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy);
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.userIds,
        e?.lastMessage,
        e?.userNames,
        e?.timeStamp,
        e?.lastMessageSeenBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
