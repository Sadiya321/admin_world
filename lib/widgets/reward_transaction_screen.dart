import 'package:flutter/material.dart';
import 'package:admin_world/const/strings.dart';

class TransactionList extends StatelessWidget {
  final bool showOnlySent;
  final bool showOnlyReceived;

  const TransactionList({
    Key? key,
    required this.showOnlySent,
    required this.showOnlyReceived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    final transactions = [
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made,
          const Color(0xFFFFC0C0)),
      _buildTransactionItem('Received', 'Rs. 360', Colors.green,
          Icons.call_received, const Color(0xFFAFFDC3)),
      _buildTransactionItem('Received', 'Rs. 360', Colors.green,
          Icons.call_received, const Color(0xFFAFFDC3)),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made,
          const Color(0xFFFFC0C0)),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made,
          const Color(0xFFFFC0C0)),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Yesterday", style: boldTextStyle),
      ),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made,
          const Color(0xFFFFC0C0)),
      _buildTransactionItem('Sent', 'Rs. 360', Colors.red, Icons.call_made,
          const Color(0xFFFFC0C0)),
      _buildTransactionItem('Received', 'Rs. 360', Colors.green,
          Icons.call_received, const Color(0xFFAFFDC3)),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'See More >>',
          style: boldTextStyle,
        ),
      ),
    ];

    final filteredTransactions = transactions.where((transaction) {
      if (transaction is ListTile) {
        final subtitleWidget = transaction.subtitle as Text;
        final subtitleText = subtitleWidget.data ?? '';
        if (showOnlySent) {
          return subtitleText == 'Sent';
        } else if (showOnlyReceived) {
          return subtitleText == 'Received';
        }
      }
      return true;
    }).toList();

    return isSmallScreen
        ? ListView(children: filteredTransactions)
        : GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 6.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(8.0),
            children: filteredTransactions,
          );
  }

  Widget _buildTransactionItem(String subtitle, String trailing,
      Color iconColor, IconData icon, Color backgroundColor) {
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
