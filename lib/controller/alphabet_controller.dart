
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grid_game/controller/initial_controller.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen.dart';

class AlaphabetProvider extends ChangeNotifier {
  final letterFormKey = GlobalKey<FormState>();

  save(BuildContext context) {
    if (letterFormKey.currentState!.validate()) {
      letterFormKey.currentState!.save();
      log(context.read<InitialScreenProvider>().letterList.toString());
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  String? validation(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }
}
