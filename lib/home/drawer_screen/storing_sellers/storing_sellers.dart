import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/strings.dart';

class StoringSellersScreen extends StatelessWidget {
  const StoringSellersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('sellers').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error fetching data'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No data available'));
              }

              var sellers = snapshot.data!.docs;

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
                      rows: _buildRows(sellers),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return const [
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(right: 100.0),
          child: Text('SL. NO', style: largewhiteTextStyle),
        ),
        numeric: true,
      ),
      DataColumn(label: Text('Name', style: largewhiteTextStyle)),
      // DataColumn(label: Text('Profile Picture', style: largewhiteTextStyle)),
      // DataColumn(label: Text('Shop Name', style: largewhiteTextStyle)),
      DataColumn(label: Text('Phone Number', style: largewhiteTextStyle)),
      // DataColumn(label: Text('Date of Register', style: largewhiteTextStyle)),
    ];
  }
  List<DataRow> _buildRows(List<DocumentSnapshot> sellers) {
    return List.generate(
      sellers.length,
      (index) {
        var seller = sellers[index];
        return DataRow(
          color: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) => Colors.white,
          ),
          cells: [
            DataCell(Center(child: Text((index + 1).toString()))),
            DataCell(Text(seller['sellerName'])),
            // DataCell(
            //   CircleAvatar(
            //     radius: 20,
            //     backgroundImage: NetworkImage(seller['profilePicture']),
            //   ),
            // ),
            // DataCell(Text(seller['gender'])),
            DataCell(Text(seller['sellerPhone'])),
            // DataCell(Text(seller['dateOfRegister'])),
          ],
        );
      },
    );
  }
}