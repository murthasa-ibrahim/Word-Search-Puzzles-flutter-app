import 'dart:developer';

import 'package:flutter/material.dart';

import '../screens/alphabet_screen.dart';

class InitialScreenProvider extends ChangeNotifier {
  final rowsController = TextEditingController();
  final columnController = TextEditingController();
  final initialFormKey = GlobalKey<FormState>();

  int rowValue = 0;
  int columnValue = 0;
  int gridCount = 0;
  List letterList = [];
  String? validation(String? str) {
    if (str == null || str.isEmpty || int.parse(str) > 7) {
      return 'enter a value between 1-7';
    }
    return null;
  }

  onSubmit(BuildContext context) {
    if (initialFormKey.currentState!.validate()) {
      rowValue = int.parse(rowsController.text);
      columnValue = int.parse(columnController.text);
      gridCount = rowValue * columnValue;
      letterList = List.generate(
          rowValue, (i) => List.filled(columnValue, '', growable: false));

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AlphabetScreen()));
    }
  }

  addToLetterList(int index, String? value) {
    int col = index % columnValue;
    int row = index ~/ columnValue;

    letterList[row][col] = value;
  }
}
