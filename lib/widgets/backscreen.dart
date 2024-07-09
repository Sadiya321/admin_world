import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/images.dart';
import 'package:flutter/material.dart';

class backScreen extends StatelessWidget {
  const backScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate screen height and width
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

   
    double sizeRatio = 1;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(116.0), // Set the border radius here
            child: Container(
              width: screenWidth * sizeRatio, // Adjust the width based on screen width
              height: screenHeight * sizeRatio, // Adjust the height based on screen height
              color: AppColor.textLight,
              child: Image.asset(
                mainbackground, // Update with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
