import 'package:flutter/material.dart';
import 'package:admin_world/const/images.dart';
import 'package:admin_world/const/strings.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          backgroundImage: AssetImage(person),
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
}
