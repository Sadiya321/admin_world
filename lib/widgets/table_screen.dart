import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/images.dart';
import 'package:admin_world/const/strings.dart';
import 'package:flutter/material.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        return SingleChildScrollView(
          scrollDirection: screenWidth < 600 ? Axis.horizontal : Axis.vertical,
          child: Container(
            
            width: 1500,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Theme(
              data: ThemeData(
                dividerColor: Colors.black,
                dividerTheme: const DividerThemeData(thickness: 1),
              ),
              child: DataTable(
                columnSpacing: 20,
                headingRowHeight: 56,
                dataRowHeight: 64,
                headingRowColor: MaterialStateProperty.all(AppColor.primary),
                columns: _buildColumns(),
                rows: _buildRows(),
              ),
            ),
          ),
        );
      },
    );
  }

  List<DataColumn> _buildColumns() {
    return const [
      DataColumn(label: Padding(
        padding: EdgeInsets.only(right:100.0),
        child: Text('SL. NO', style: largewhiteTextStyle),
      ), numeric: true),
     
      DataColumn(label: Text('Name', style: largewhiteTextStyle)),
      DataColumn(label: Text('Profile Picture', style: largewhiteTextStyle)),
      DataColumn(label: Text('Gender', style: largewhiteTextStyle)),
      DataColumn(label: Text('Phone Number', style: largewhiteTextStyle)),
      DataColumn(label: Text('Date of Register', style: largewhiteTextStyle)),
    ];
  }

  List<DataRow> _buildRows() {
    return List.generate(
      4,
      (index) => DataRow(
        color: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => Colors.white,
        ),
        cells: [
          DataCell(Center(child: Text((index + 1).toString()))),
          const DataCell(Text('Aleem Sheikh')),
          DataCell(
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(person),
            ),
          ),
          const DataCell(Text('Male')),
          const DataCell(Text('9876543526')),
          const DataCell(Text('01/05/2024')),
        ],
      ),
    );
  }
}
