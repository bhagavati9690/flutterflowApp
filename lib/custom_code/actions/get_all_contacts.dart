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

import 'package:flutter_contacts/flutter_contacts.dart';

Future<List<ContactStruct>?> getAllContacts() async {
  if (await FlutterContacts.requestPermission()) {
    try {
      List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: false,
      );
      // print(contacts);
      if (contacts.isEmpty) {
        print("No contacts found.");
        return [];
      }

      List<ContactStruct> contactStructs = contacts.map((contact) {
        // Extract address if available
        AddressStruct? addressStruct;
        if (contact.addresses.isNotEmpty) {
          final address = contact.addresses.first;
          addressStruct = AddressStruct(
            street: address.street,
            city: address.city,
            state: address.state,
            postalCode: address.postalCode,
            country: address.country,
          );
        }

        String dob = ''; // Initialize INSIDE the map function

        if (contact.events.isNotEmpty) {
          for (final event in contact.events) {
            // Correct loop
            if (event.label.toString() == "EventLabel.birthday") {
              dob = "${event.month}/${event.day}/${event.year ?? ''}";
              break; // Stop iterating once the birthday is found
            }
          }
        }

        return ContactStruct(
            firstName: contact.name.first,
            lastName: contact.name.last,
            middleName: contact.name.middle,
            displayName: contact.displayName,
            phoneNumbers: contact.phones.map((phone) => phone.number).toList(),
            // emailAddresses: contact.emails.map((email) => email.address).toList(),
            emailAddresses:
                contact.emails.isNotEmpty ? contact.emails.first.address : '',
            address: addressStruct,
            dob: dob,
            selection: false);
      }).toList();
      print(contactStructs);
      return contactStructs;
    } catch (e) {
      print("Error getting contacts: $e");
      return null;
    }
  } else {
    print("Permission denied.");
    return null;
  }
}
