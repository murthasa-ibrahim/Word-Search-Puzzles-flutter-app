import 'package:flutter/material.dart';
import 'package:grid_game/controller/alphabet_controller.dart';
import 'package:grid_game/controller/initial_controller.dart';
import 'package:provider/provider.dart';

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialController = context.read<InitialScreenProvider>();
    final alphaController = context.read<AlaphabetProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('Enter Alphabets',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Form(
                key: alphaController.letterFormKey,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: initialController.gridCount,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: initialController.columnValue,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return LetterBox(index: index,);
                  },
                ),
              ),
             const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () => alphaController.save(context),
                child: const Text(
                  'submit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LetterBox extends StatelessWidget {
 const  LetterBox({
    Key? key, required this.index,
  }) : super(key: key);
 final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            maxLength: 1,
            textInputAction: TextInputAction.next,
            onSaved: (newValue) => context.read<InitialScreenProvider>().addToLetterList(index, newValue) ,
            validator: (value)=> context.read<AlaphabetProvider>().validation(value),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              counterText: ''
            ),
          ),
        ),

      ),
    );
  }
}
