import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/images.dart';
import 'package:admin_world/const/strings.dart';
import 'package:admin_world/home/main_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const double _sizeRatio = 0.98;
  static const double _borderRadius = 16.0;
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
                  Expanded(child: _buildBackgroundImage(screenWidth, screenHeight)),
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
            padding: const EdgeInsets.only(top: _paddingTop),
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
            left: 70.0,
            child: Text(
              "Dashboard",
              style: largboldTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
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
          _buildProfileSection(),
          Expanded(child: _buildTransactionList()),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 8.0),
          _buildProfileInfo(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage('assets/images/profile_image.png'),
        ),
        Icon(Icons.settings, color: Colors.grey),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aleem Sheikh',
          style: boldTextStyle,
        ),
        Text(
          'Admin',
          style: normalTextStyle,
        ),
        SizedBox(height: 40),
        Text("All Transactions", style: boldTextStyle),
        SizedBox(height: 20),
        Text("Today", style: normalTextStyle),
      ],
    );
  }

  Widget _buildTransactionList() {
    final transactions = [
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made, Color(0xFFFFC0C0)),
      _buildTransactionItem('Received', 'Rs. 360', Colors.green, Icons.call_received, Color(0xFFAFFDC3)),
      _buildTransactionItem('Received', 'Rs. 360', Colors.green, Icons.call_received, Color(0xFFAFFDC3)),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made, Color(0xFFFFC0C0)),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made, Color(0xFFFFC0C0)),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Yesterday", style: boldTextStyle),
      ),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made, Color(0xFFFFC0C0)),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made, Color(0xFFFFC0C0)),
      _buildTransactionItem('Received', 'Rs. 360', Colors.green, Icons.call_received, Color(0xFFAFFDC3)),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'See More >',
          style: boldTextStyle,
        ),
      ),
    ];

    return ListView(children: transactions);
  }

  Widget _buildTransactionItem(String subtitle, String trailing, Color iconColor, IconData icon, Color backgroundColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Icon(icon, color: iconColor),
      ),
      title: const Text('Aleem Sheikh', style: boldTextStyle),
      subtitle: Text(subtitle, style: smallTextStyle),
      trailing: Text(trailing, style: smallTextStyle),
    );
  }
}
