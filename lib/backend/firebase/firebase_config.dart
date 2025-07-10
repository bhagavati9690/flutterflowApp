import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD5rkSkGKvyrsrgpg8vMRbVNNzlA3m1xck",
            authDomain: "clbxmobileipbased.firebaseapp.com",
            projectId: "clbxmobileipbased",
            storageBucket: "clbxmobileipbased.firebasestorage.app",
            messagingSenderId: "843864992614",
            appId: "1:843864992614:web:e8f79b1a85fc98be3ab6a7",
            measurementId: "G-PK2NBK3TW1"));
  } else {
    await Firebase.initializeApp();
  }
}
