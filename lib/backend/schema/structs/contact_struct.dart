// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactStruct extends FFFirebaseStruct {
  ContactStruct({
    String? firstName,
    String? displayName,
    String? lastName,
    String? middleName,
    List<String>? phoneNumbers,
    String? emailAddresses,
    String? dob,
    AddressStruct? address,
    bool? selection,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _displayName = displayName,
        _lastName = lastName,
        _middleName = middleName,
        _phoneNumbers = phoneNumbers,
        _emailAddresses = emailAddresses,
        _dob = dob,
        _address = address,
        _selection = selection,
        super(firestoreUtilData);

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "middleName" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  set middleName(String? val) => _middleName = val;

  bool hasMiddleName() => _middleName != null;

  // "phoneNumbers" field.
  List<String>? _phoneNumbers;
  List<String> get phoneNumbers => _phoneNumbers ?? const [];
  set phoneNumbers(List<String>? val) => _phoneNumbers = val;

  void updatePhoneNumbers(Function(List<String>) updateFn) {
    updateFn(_phoneNumbers ??= []);
  }

  bool hasPhoneNumbers() => _phoneNumbers != null;

  // "emailAddresses" field.
  String? _emailAddresses;
  String get emailAddresses => _emailAddresses ?? '';
  set emailAddresses(String? val) => _emailAddresses = val;

  bool hasEmailAddresses() => _emailAddresses != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  set dob(String? val) => _dob = val;

  bool hasDob() => _dob != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  set address(AddressStruct? val) => _address = val;

  void updateAddress(Function(AddressStruct) updateFn) {
    updateFn(_address ??= AddressStruct());
  }

  bool hasAddress() => _address != null;

  // "selection" field.
  bool? _selection;
  bool get selection => _selection ?? true;
  set selection(bool? val) => _selection = val;

  bool hasSelection() => _selection != null;

  static ContactStruct fromMap(Map<String, dynamic> data) => ContactStruct(
        firstName: data['firstName'] as String?,
        displayName: data['displayName'] as String?,
        lastName: data['lastName'] as String?,
        middleName: data['middleName'] as String?,
        phoneNumbers: getDataList(data['phoneNumbers']),
        emailAddresses: data['emailAddresses'] as String?,
        dob: data['dob'] as String?,
        address: data['address'] is AddressStruct
            ? data['address']
            : AddressStruct.maybeFromMap(data['address']),
        selection: data['selection'] as bool?,
      );

  static ContactStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContactStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'firstName': _firstName,
        'displayName': _displayName,
        'lastName': _lastName,
        'middleName': _middleName,
        'phoneNumbers': _phoneNumbers,
        'emailAddresses': _emailAddresses,
        'dob': _dob,
        'address': _address?.toMap(),
        'selection': _selection,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'middleName': serializeParam(
          _middleName,
          ParamType.String,
        ),
        'phoneNumbers': serializeParam(
          _phoneNumbers,
          ParamType.String,
          isList: true,
        ),
        'emailAddresses': serializeParam(
          _emailAddresses,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.DataStruct,
        ),
        'selection': serializeParam(
          _selection,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ContactStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactStruct(
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['displayName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        middleName: deserializeParam(
          data['middleName'],
          ParamType.String,
          false,
        ),
        phoneNumbers: deserializeParam<String>(
          data['phoneNumbers'],
          ParamType.String,
          true,
        ),
        emailAddresses: deserializeParam(
          data['emailAddresses'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.String,
          false,
        ),
        address: deserializeStructParam(
          data['address'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
        selection: deserializeParam(
          data['selection'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ContactStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ContactStruct &&
        firstName == other.firstName &&
        displayName == other.displayName &&
        lastName == other.lastName &&
        middleName == other.middleName &&
        listEquality.equals(phoneNumbers, other.phoneNumbers) &&
        emailAddresses == other.emailAddresses &&
        dob == other.dob &&
        address == other.address &&
        selection == other.selection;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        displayName,
        lastName,
        middleName,
        phoneNumbers,
        emailAddresses,
        dob,
        address,
        selection
      ]);
}

ContactStruct createContactStruct({
  String? firstName,
  String? displayName,
  String? lastName,
  String? middleName,
  String? emailAddresses,
  String? dob,
  AddressStruct? address,
  bool? selection,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactStruct(
      firstName: firstName,
      displayName: displayName,
      lastName: lastName,
      middleName: middleName,
      emailAddresses: emailAddresses,
      dob: dob,
      address: address ?? (clearUnsetFields ? AddressStruct() : null),
      selection: selection,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactStruct? updateContactStruct(
  ContactStruct? contact, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contact
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactStructData(
  Map<String, dynamic> firestoreData,
  ContactStruct? contact,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contact == null) {
    return;
  }
  if (contact.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contact.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactData = getContactFirestoreData(contact, forFieldValue);
  final nestedData = contactData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contact.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactFirestoreData(
  ContactStruct? contact, [
  bool forFieldValue = false,
]) {
  if (contact == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contact.toMap());

  // Handle nested data for "address" field.
  addAddressStructData(
    firestoreData,
    contact.hasAddress() ? contact.address : null,
    'address',
    forFieldValue,
  );

  // Add any Firestore field values
  contact.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactListFirestoreData(
  List<ContactStruct>? contacts,
) =>
    contacts?.map((e) => getContactFirestoreData(e, true)).toList() ?? [];
