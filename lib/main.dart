import 'package:admin_world/home/drawer_screen/home_screen.dart';
import 'package:admin_world/home/main_screen.dart';
import 'package:admin_world/widgets/graph_container.dart';
import 'package:admin_world/widgets/reward_transaction_screen.dart';
import 'package:admin_world/widgets/stat_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

       debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: ThemeData(
    fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),


      home:  
      
      // MainScreen(),
     
       const AdminView(
            documentId: '',
          ),
    );
  }
}
