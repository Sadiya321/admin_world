import 'package:admin_world/home/drawer_screen/admin_view.dart';
import 'package:admin_world/home/drawer_screen/transaction_screen/transaction_screen.dart';
import 'package:admin_world/home/drawer_screen/users_screen/users_screen.dart';
import 'package:admin_world/home/login_screen/login_screen.dart';
import 'package:admin_world/home/main_screen.dart';
import 'package:admin_world/widgets/graph_container.dart';
import 'package:admin_world/widgets/reward_transaction_screen.dart';
import 'package:admin_world/widgets/stat_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDrdjmkT74JFbCQS2hKS8Wk0vuhFvHa4kE",
          appId: "1:392723461464:web:5c17c17e31b97595a8212d",
          messagingSenderId: "392723461464",
          projectId: "green-world-f814b"));
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
      
      //  LoginsScreen(),

       const AdminView(
            documentId: '',
          ),
    );
  }
}
