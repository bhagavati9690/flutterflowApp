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

Future<List<ContactStruct>?> searchContacts(String? query) async {
  if (await FlutterContacts.requestPermission()) {
    try {
      List<Contact> searchContacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: false,
      );

      print(searchContacts);
      print(query);
      if (searchContacts.isEmpty) {
        print("No contacts found.");
        return [];
      }

      // Return all contacts if query is null or empty
      /*     List<Contact> filteredContacts = query == null || query.trim().isEmpty
          ? searchContacts
          : searchContacts
              .where((contact) => contact.displayName
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();*/

      List<Contact> filteredContacts = searchContacts;
      if (query != null && query.trim().isNotEmpty) {
        print('innnn');
        filteredContacts = searchContacts
            .where((contact) =>
                contact.displayName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      if (filteredContacts.isEmpty) {
        print("No contacts found.");
        return [];
      }

      List<ContactStruct> contactStructs = filteredContacts.map((contact) {
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

        String dob = '';
        if (contact.events.isNotEmpty) {
          for (final event in contact.events) {
            if (event.label == EventLabel.birthday) {
              dob = "${event.month}/${event.day}/${event.year ?? ''}";
              break;
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
          selection: false,
        );
      }).toList();

      // print(contactStructs);
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
