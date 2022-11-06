


import 'package:flutter/material.dart';
import 'package:grid_game/controller/home_controller.dart';
import 'package:grid_game/controller/initial_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().onInit(context);
  }
  @override
  Widget build(BuildContext context) {
    final initialProvider = context.read<InitialScreenProvider>();
    final homeProvider = context.read<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Search for a Word',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(onPressed:() => homeProvider.restart(context), icon:const  Icon(Icons.restore_rounded,size: 30,color: Colors.white,))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: homeProvider.searchController,
                    decoration: InputDecoration(
                        hintText: 'search.....',
                        
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              homeProvider.searchForWord(context);
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        fillColor: Colors.black,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),),
              GridView.builder(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: initialProvider.gridCount,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:initialProvider.columnValue ,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Consumer<HomeProvider>(
                    builder: (context, value, child) => 
                 Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: homeProvider.buildGridColor(index, context) 
                        ? Colors.red
                        : Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: homeProvider.buildGriditems(index,context),
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
