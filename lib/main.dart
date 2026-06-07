import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        textTheme: GoogleFonts.intelOneMonoTextTheme(),
      ),
      home: Scaffold(
        body: const HomeScreen(),
      ),
    );
  }
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  bool _isEditing = false;

  void _editingChanged(bool value){
    setState(() {
      _isEditing = value;
    });
  }


  @override
  Widget build(BuildContext context){
    return Stack(
      children: [

        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children:[
            SizedBox(

            width: double.infinity,
            child: Text(
              'Have a \ngreat \nday',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
              ),
            ),

            ]
          )
        ),


        Positioned.fill(
            child:BlurBlock(isVisible: _isEditing,
            onTap: (){_editingChanged(false);},)
        ),

        Positioned(
            top: 180,
            left: 16,
            right: 16,
            child: FirstBlock(original: 'Are You ready', editingChanged: _editingChanged, isEditing:_isEditing),
        ),

      ]
    );
  }
}


class FirstBlock extends StatefulWidget{
  final String original;
  final bool isEditing;
  final Function(bool) editingChanged;
  const FirstBlock({super.key, required this.original, required this.isEditing,  required this.editingChanged});

  @override
  State<FirstBlock> createState() => _FirstBlockState();
}

class _FirstBlockState extends State<FirstBlock>{

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: (){
            widget.editingChanged(!widget.isEditing);
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: widget.isEditing ? 400:200,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey
            ),
            child: widget.isEditing ? TextField(autofocus: true) : Text(widget.original))
    );
  }
}



class BlurBlock extends StatelessWidget{
  final bool isVisible;
  final VoidCallback onTap;
  const BlurBlock({super.key, required this.isVisible, required this.onTap});
  
  @override
  Widget build(BuildContext context){
    if(!isVisible) return SizedBox.shrink();
    return ClipRect(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                color: Colors.grey.withOpacity(0.1)
            ),
          )
      )
    );
  }
}

