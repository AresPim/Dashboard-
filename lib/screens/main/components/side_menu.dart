
import 'package:admin/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../documentVerification/documents.dart';
import '../../post/newPost.dart';
import '../../reports/reports.dart';
import '../../settings/settings.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/dashboard.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "User",
            svgSrc: "assets/icons/user.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Posts",
            svgSrc: "assets/icons/donation.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Posts()),
              );
            },
          ),
          DrawerListTile(
            title: "Cards",
            svgSrc: "assets/icons/products.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerificationTable()), // Naviguer vers la classe DocumentScreen
              );
            },
          ),
          DrawerListTile(
            title: "Reports",
            svgSrc: "assets/icons/products.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reports()),
              );
            },
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/edit.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/settings.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageLayout()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}