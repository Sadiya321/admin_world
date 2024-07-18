import 'package:admin_world/const/strings.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String count;
  final String subtitle;

  const StatCard({
    Key? key,
    required this.title,
    required this.count,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;

    TextStyle smallTextStyle = isSmallScreen
        ? smallscreenwhiteTextStyle
        : smallwhiteTextStyle;

    TextStyle boldTextStyle = isSmallScreen
        ? smallboldwhiteTextStyle
        : boldwhiteTextStyle;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 100,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF07C055), // Start color
              Color(0xFF198747), // End color
            ],
            begin: Alignment.topCenter, // Gradient starts from top
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: smallTextStyle,
              ),
              const SizedBox(height: 5),
              Text(
                count,
                style: boldTextStyle,
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: smallTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCardsRow extends StatelessWidget {
  const StatCardsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        StatCard(
          title: "Total Users",
          count: "26",
          subtitle: "7 Users in last week",
        ),
        StatCard(
          title: "Pending Seller Request",
          count: "2",
          subtitle: "2 Pending request",
        ),
        StatCard(
          title: "Total Sellers",
          count: "6",
          subtitle: "2 Sellers in last week",
        ),
        StatCard(
          title: "Total Rewards Issued",
          count: "18",
          subtitle: "Total rewards distributed",
        ),
      ],
    );
  }
}
