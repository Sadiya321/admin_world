import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Graph Placeholder',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
