import 'package:flutter/material.dart';

import '../Authentication/login.screen.dart';
import '../splash.screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the header
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: height * 0.5,
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "NETFLIX",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Opacity(opacity: 0.5, child: iconNetflix(height, width)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: height * 0.6,
                  color: Colors.black,
                  child: Column(
                    children: [
                      const ReusableContainer(
                        leadingIcon: Icons.list,
                        text: "My List",
                      ),
                      const ReusableContainer(
                        leadingIcon: Icons.favorite,
                        text: "Favorite",
                      ),
                      const ReusableContainer(
                        leadingIcon: Icons.subscriptions_outlined,
                        text: "Subscription",
                      ),
                      const ReusableContainer(
                        leadingIcon: Icons.info,
                        text: "About Us",
                      ),
                      InkWell(
                        onTap: () {
                          showCustomDialog(context: context);
                        },
                        child: const ReusableContainer(
                          leadingIcon: Icons.logout,
                          text: "Logout",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  final IconData leadingIcon;
  final String text;

  const ReusableContainer({
    Key? key,
    required this.leadingIcon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: height * 0.07,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white30,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.red,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.04,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          textAlign: TextAlign.center,
          'Are you sure you want to log out?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: const Text(
                    "No",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
