import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/strings.dart';
import 'package:admin_world/home/drawer_screen/dashboard_screen/dashboard_screen.dart';
import 'package:admin_world/home/drawer_screen/seller_screen/seller_screen.dart';
import 'package:admin_world/home/drawer_screen/transaction_screen/transaction_screen.dart';
import 'package:admin_world/home/drawer_screen/users_screen/users_screen.dart';
import 'package:admin_world/const/images.dart';
import 'package:admin_world/home/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminView extends StatefulWidget {
  final String documentId;
  const AdminView({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  String _selectedItem = '';
  String selectedContent = 'Dashboard';
  void onDrawerItemClicked(String content) {
    setState(() {
      selectedContent = content;
    });
  }

  Future<void> _signOut() async {
    try {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginsScreen()),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('DashBoard',style:boldTextStyle),
            ),
            ///////////////////////// // small screen drawer /////////////////////////

            drawer: Drawer(
              child: Container(
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColor.textLight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Green",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "World",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: AppColor.textPrimary,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    buildDrawerItem(Icons.dashboard, 'Dashboard', () {
                      const TransactionScreen();
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildDrawerItem(Icons.people, 'Users', () {
                      onDrawerItemClicked('Users');
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildDrawerItem(Icons.people, 'Sellers ', () {
                      onDrawerItemClicked('Sellers');
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildDrawerItem(Icons.task_rounded, 'Transaction', () {
                      onDrawerItemClicked('Transaction');
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildDrawerItem(Icons.logout_rounded, 'Logout', () {
                      onDrawerItemClicked('Log Out');
                    }),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        lauchpad,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: buildBody(selectedContent),
          );
        } else {
          return Scaffold(
            body:
                ///////////////////////// // full screen drawer /////////////////////////

                Row(
              children: [
                Container(
                  width: 240,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColor.textLight,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 28.0, left: 19),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Green",
                                style: TextStyle(
                                  fontSize: 22,fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "World",
                                style: TextStyle(
                                  fontSize: 22,
                               fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textPrimary,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      buildDrawerItem(Icons.dashboard, 'Dashboard', () {
                        onDrawerItemClicked('Dashboard');
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      buildDrawerItem(Icons.people, 'Users', () {
                        onDrawerItemClicked('Users');
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      buildDrawerItem(Icons.people, 'Sellers', () {
                        onDrawerItemClicked('Sellers');
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      buildDrawerItem(Icons.task_rounded, 'Transaction', () {
                        onDrawerItemClicked('Transaction');
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      buildDrawerItem(Icons.logout_rounded, 'Logout', () {
                        onDrawerItemClicked('Log Out');
                      }),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        lauchpad,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: buildBody(selectedContent),
                ),
              ],
            ),
            ///////////////////////// // full screen drawer /////////////////////////
          );
        }
      },
    );
  }

  Widget buildBody(String selectedContent) {
    switch (selectedContent) {
      case 'Dashboard':
        return const DashboardScreen();
      case 'Users':
        return const UserScreen();
      case 'Sellers':
        return const SellerScreen();
      case 'Transaction':
        return const TransactionScreen();
        
      default:
        return buildDefaultContent();
    }
    
  }
   Widget buildDefaultContent() {
    return const Text('Select an item from the drawer to view content.',style:boldTextStyle);
  }


 
  Widget buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    bool isSelected = _selectedItem == title;

    return Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? AppColor.primary : AppColor.textPrimary,
        ),
        title: Text(
          title,
          style: TextStyle(
             fontSize: 16,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  decoration: TextDecoration.none,
            color: isSelected ? AppColor.primary : AppColor.textPrimary,
          ),
        ),
        onTap: () async {
          setState(() {
            _selectedItem = title;
          });
          if (title == 'Log Out') {
            bool? confirmed = await showLogoutConfirmationDialog(context);
            if (confirmed == true) {
              await _signOut();
            }
          } else {
            onTap();
          }
        },
      ),
    );
  }

   Future<bool?> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation',style:normalTextStyle),
          content: const Text('Are you sure you want to log out?',style:normalTextStyle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No',style:normalTextStyle),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
                await _signOut();
              },
              child: const Text('Yes',style:normalTextStyle),
            ),
          ],
        );
      },
    );
  }
}

