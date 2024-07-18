import 'package:admin_world/widgets/reward_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/images.dart';
import 'package:admin_world/const/strings.dart';
import 'package:admin_world/home/main_screen.dart';
import 'package:admin_world/widgets/profile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const double _sizeRatio = 0.98;
  static const double _borderRadius = 75.0;
  static const double _paddingTop = 4.0;
  static const double _menuPadding = 8.0;

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
                    SizedBox(height: 600, child: _buildSidebar()),
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: _buildBackgroundImage(screenWidth, screenHeight)),
                  SizedBox(width: 300, child: _buildSidebar()),
                ],
              ),
      ),
    );
  }

  Widget _buildBackgroundImage(double screenWidth, double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: _paddingTop),
            child: Container(
              width: screenWidth * _sizeRatio,
              height: screenHeight * _sizeRatio,
              color: AppColor.textLight,
              child: Image.asset(
                mainbackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 20.0,
            left: 25.0,
            child: Text(
              "Dashboard",
              style: largboldTextStyle,
            ),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: MainScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ProfileSection(),
          Expanded(
            child: TransactionList(
                showOnlySent: false,
                showOnlyReceived: false), // Show all transactions
          ),
        ],
      ),
    );
  }
}
