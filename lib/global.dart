import 'package:elearning_app/src/common/service/storage_service.dart';
import 'package:elearning_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    //initializing firebase ......
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // shared Preference...
    storageService = await StorageService().init();
  }
}
