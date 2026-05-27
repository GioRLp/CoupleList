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
  bool isEditing = false;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 48,bottom: 16),
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

          SizedBox(height: 16),

          GestureDetector(
            onTap: (){
              setState(() {
                isEditing=true;
              });
            },
            child: Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child:
                Text(
                  'Are you ready to share your plans, thoughts, maybe concerns?\nAdd a note or create a list.\nJust press into the gray block to start writing.',
                  style: TextStyle(fontSize: 12),
                )
            ),
          ),


          SizedBox(height: 16),

          GestureDetector(
            onTap: (){
              setState(() {
                isEditing=true;
              });
            },
            child: Container(
                height: 58,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Text(
                  'would you like to remember and old note?',
                  style: TextStyle(fontSize: 12),

                )
            ),
          ),


        ]
      )
    );
  }
}