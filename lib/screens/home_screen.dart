import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grid_game/controller/home_controller.dart';
import 'package:grid_game/controller/initial_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);
//  List<String> s = ['e','f','g'];
  @override
  Widget build(BuildContext context) {
    final initialController = context.read<InitialScreenProvider>();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              const Text(
                'Search for a Word',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return 
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(12),),
                          child: Center(child: context.read<HomeProvider>().buildGriditems(index,context),),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Text('A',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)