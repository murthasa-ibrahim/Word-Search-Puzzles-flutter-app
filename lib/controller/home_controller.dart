
import 'package:flutter/material.dart';
import 'package:grid_game/controller/initial_controller.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
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
}
