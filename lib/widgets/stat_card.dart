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
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 120,
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
        child:  Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: smallwhiteTextStyle
              ),
              const SizedBox(height: 10,),
              Text(
                count,
                style: boldwhiteTextStyle
              ),const SizedBox(height: 10,),
              Text(
                subtitle,
                style: smallwhiteTextStyle
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


