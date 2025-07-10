// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

Future<ContactStruct?> pickContact() async {
  try {
    final Contact? pickedContact = await FlutterContacts.openExternalPick();

    if (pickedContact != null) {
      // Create a single ContactStruct from the picked Contact
      final contactStruct = ContactStruct(firstName: pickedContact.name.first);

      return contactStruct; // Return the single ContactStruct
    } else {
      return null;
    }
  } catch (e) {
    print("Error picking contact: $e");
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
