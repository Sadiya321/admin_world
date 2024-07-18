import 'package:admin_world/const/images.dart';
import 'package:admin_world/widgets/custome_field.dart';
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
        padding:const EdgeInsets.all(16.0),
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
          const  SizedBox(height: 20),
           const GraphWidget(),
           const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                     imagePath: bookstar,
                    title: 'Create Task',
                     title1:'Create a new task',
                    onTap: () {
                    
                    },
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: CustomTextField(
                     imagePath: personclock,
                    title: 'Seller Request',
                     title1:'2 pending request from last week',
                    onTap: () {
                    
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
             const SizedBox(width: 20),
            const Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                     imagePath: bookclock,
                    title: 'Recent Task Created',
                     title1:'12 Task created last week',
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: CustomTextField(
                     imagePath: bookclock,
                    title: 'Withdrawal Request',
                     title1:'1 pending request from last week',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(width: 20),
             Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                     imagePath: bookclock,
                    title: 'Task Expired',
                     
                    title1:'8 Task expired last week',
                    onTap: () {
                     
                    },
                  ),
                ),
               const SizedBox(width: 40),
                Expanded(
                  child: CustomTextField(
                    imagePath: bookclock,
                    title: 'Transactions',
                    title1:'Last week transaction',
                    onTap: () {
                      
                    },
                  ),
                ),
              ],
            ),
           const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
