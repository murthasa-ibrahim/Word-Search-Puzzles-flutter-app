import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grid_game/controller/initial_controller.dart';
import 'package:provider/provider.dart';

import '../screens/initial_screen.dart';

class HomeProvider extends ChangeNotifier {
  List boolList = [];
   void onInit(BuildContext context){
      final ctr = context.read<InitialScreenProvider>();
       boolList = List.generate(ctr.rowValue,
        (index) => List.filled(ctr.columnValue, false, growable: false));
   }
  InitialScreenProvider ctr = InitialScreenProvider();
  final searchController = TextEditingController();
  String word = '';
  Widget buildGriditems(int index, BuildContext context) {
    final ctr = context.read<InitialScreenProvider>();
    int c = index % ctr.columnValue;
    int r = index ~/ ctr.columnValue;

    return Text(
      ctr.letterList[r][c],
      style: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  buildGridColor(int index, BuildContext context) {
    final ctr = context.read<InitialScreenProvider>();
    int c = index % ctr.columnValue;
    int r = index ~/ ctr.columnValue;
    return boolList[r][c];
  }

  void searchForWord(BuildContext context) {
    boolList = List.generate(ctr.rowValue,
        (index) => List.filled(ctr.columnValue, false, growable: false));
    ctr = context.read<InitialScreenProvider>();
    final c = ctr.columnValue;
    final r = ctr.rowValue;
    word = searchController.text;
    for (int row = 0; row < r; row++) {
      for (int colm = 0; colm < c; colm++) {
        if (ctr.letterList[row][colm] == word[0] &&
            searchFromCell(row, colm)) {}
      }
    }
  }

  bool searchFromCell(int row, int colm) {
    searchHorizontaly(row, colm);
    searchDiagnally(row, colm);
    return searchVertically(row, colm);
  }

  bool searchHorizontaly(int row, int colm) {
    int i;
    if (word.length > ctr.columnValue) {
      return false;
    }

    for (i = 0; i < word.length && colm < ctr.columnValue; i++, colm++,) {
      if (ctr.letterList[row][colm] != word[i]) {
        return false;
      }
      boolList[row][colm] = true;
      notifyListeners();
    }
    if (i == word.length) {
      return true;
    }
    return false;
  }

  bool searchVertically(int row, int colm) {
    int i;
    if (word.length > ctr.rowValue) {
      return false;
    }

    for (i = 0; i < word.length && row < ctr.rowValue; i++, row++,) {
      if (ctr.letterList[row][colm] != word[i]) {
        return false;
      }
      boolList[row][colm] = true;
      notifyListeners();
    }

    log(i.toString());
    if (i == word.length) {
      return true;
    }
    return false;
  }

  bool searchDiagnally(int row, int colm) {
    int i;
    if (word.length > ctr.columnValue || word.length > ctr.rowValue) {
      return false;
    }

    for (i = 0;
        i < word.length && colm < ctr.columnValue && row < ctr.rowValue;
        i++, colm++, row++) {
      if (ctr.letterList[row][colm] != word[i]) {
        return false;
      }
      boolList[row][colm] = true;
      notifyListeners();
    }

    log(i.toString());
    if (i == word.length) {
      return true;
    }
    return false;
  }

  void restart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Restart Game',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Do you want to restart the game',
          style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('No')),
          TextButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const InitialScreen(),)), child: const Text('Yes'))
        ],
      ),
    );
  }
}
