import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/images.dart';
import 'package:admin_world/const/strings.dart';
import 'package:admin_world/home/drawer_screen/storing_sellers/storing_sellers.dart';
import 'package:admin_world/widgets/storing_user.dart';
import 'package:flutter/material.dart';

class SellerScreen extends StatelessWidget {
  final List<Seller> sellers; // List of sellers

  const SellerScreen({Key? key, required this.sellers}) : super(key: key);

  static const double _sizeRatio = 0.98;
  static const double _borderRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: AppColor.textLight,
      body: Center(
        child: isSmallScreen
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    _buildBackgroundImage(screenWidth, screenHeight),
                    // SizedBox(height: 600, child: _buildSidebar()),
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildBackgroundImage(screenWidth, screenHeight),
                  ),
                  // SizedBox(width: 300, child: _buildSidebar()),
                ],
              ),
      ),
    );
  }

  Widget _buildBackgroundImage(double screenWidth, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Container(
          width: screenWidth * _sizeRatio,
          height: screenHeight * _sizeRatio,
          decoration: BoxDecoration(
            color: AppColor.textLight,
          ),
          child: Stack(
            children: [
              Image.asset(
                mainbackground,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Sellers",
                      style: largboldTextStyle, // Assuming largboldTextStyle is defined elsewhere
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: StoringSellersScreen(), // Convert sellers to users here
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Seller {
  final String name;
  final String profilePicture;
  final String gender;
  final String phoneNumber;
  final String dateOfRegister;
  final String status;

  Seller({
    required this.name,
    required this.profilePicture,
    required this.gender,
    required this.phoneNumber,
    required this.dateOfRegister,
    required this.status,
  });
}
