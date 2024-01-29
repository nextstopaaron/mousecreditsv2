import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC2TVysDJWhgxlrtbMlkNwr-viG4nf4ZTU",
            authDomain: "mouse-credits-v06eyn.firebaseapp.com",
            projectId: "mouse-credits-v06eyn",
            storageBucket: "mouse-credits-v06eyn.appspot.com",
            messagingSenderId: "315267496378",
            appId: "1:315267496378:web:ddde47ef5e2ed99121c583"));
  } else {
    await Firebase.initializeApp();
  }
}
