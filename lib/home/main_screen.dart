import 'package:admin_world/widgets/graph_container.dart';
import 'package:admin_world/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Small screen: show Drawer
          return _buildBody(context);
        } else {
          // Large screen: show side panel
          return Row(
            children: [
              Expanded(child: _buildBody(context)),
            ],
          );
        }
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Row(
              children: <Widget>[
                Expanded(
                  child: StatCard(
                    title: 'Total Users',
                     count: '7',
                      subtitle: '7 Users in last week',
                    // 'Total Users',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'Pending Seller Request', 
                    count: '26', 
                    subtitle: '2 Pending request',
                    // 'Pending Seller Request',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'Total Sellers',
                     count: '62',
                      subtitle: '2 Sellers in last week',
                    // 'Total Sellers',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'Total Rewards Issued',
                     count: '04', 
                     subtitle: 'Total rewards distributed',
                    // 'Total Rewards Issued',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GraphWidget(),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildActionCard(
                    'Create Task',
                    Icons.add_task,
                    Colors.green,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildActionCard(
                    'Seller Request',
                    Icons.request_page,
                    Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildActionCard(
                    'Recent Task Created',
                    Icons.task,
                    Colors.blue,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildActionCard(
                    'Withdrawal Request',
                    Icons.money,
                    Colors.red,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 10),
            // _buildActionCard('Task Expired', Icons.timer_off, Colors.purple),
            // const SizedBox(height: 10),
            // _buildActionCard('Transactions', Icons.money, Colors.teal),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
