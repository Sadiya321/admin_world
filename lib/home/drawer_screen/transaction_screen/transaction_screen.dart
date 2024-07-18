import 'package:admin_world/widgets/reward_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin_world/widgets/backscreen.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackScreen(
      child: Padding(
        padding: EdgeInsets.all(28.0),
        child: Row(
          children: [
            // Column for Sent Transactions
            Expanded(
              child: TransactionList(
                showOnlySent: true, showOnlyReceived: false,
                ), // Display only "Sent" transactions
            ),
            // Spacer or Divider can be added here if needed
            VerticalDivider(
              color: Colors.grey,
              width: 1,
              thickness: 1,
            ),
            // Column for Received Transactions (optional if you want to show Received transactions on the right)
            Expanded(
              child: TransactionList(
                showOnlySent: false,showOnlyReceived: true,
                ), // Display all transactions or only "Received" transactions
            ),
          ],
        ),
      ),
    );
  }
}
