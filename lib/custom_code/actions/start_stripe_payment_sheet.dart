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

import 'package:flutter_stripe/flutter_stripe.dart';

// Set your action name, define your arguments and return parameter,
Future<void> startStripePaymentSheet(
    String clientSecret,
    Future Function()? postPaySuccessAction,
    Future Function()? postPayFailAction) async {
  try {
    Stripe.publishableKey = 'pk_test_m4vU6tww3aJ44gh7Z3Zj9AFE';
    await Stripe.instance.applySettings();
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Your App Name',
        style: ThemeMode.light, // or dark
        allowsDelayedPaymentMethods: false,
      ),
    );

    await Stripe.instance.presentPaymentSheet();
    print('Payment completed successfully');
    if (postPaySuccessAction != null) {
      await postPaySuccessAction();
    }
  } catch (e) {
    print('Error showing payment sheet: $e');
    if (postPayFailAction != null) {
      await postPayFailAction();
    }
    throw e;
  }
}
// and then add the boilerplate code using the green button on the right!
