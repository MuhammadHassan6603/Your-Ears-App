import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:your_ears_app/pages/home/presentation/provider/drawer_provider.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/media_query.dart';

Widget drawer(BuildContext context) {
  var userProvider = Provider.of<LoginProvider>(context, listen: false);
  return Drawer(
    backgroundColor: AppColors.whiteColor,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getHeight(context) * 0.06),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          SizedBox(height: 5),
          // Profile Section
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue),
            ),
            child: Center(
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: userProvider
                                .userModel?.user?.profilePic?.isNotEmpty ==
                            true
                        ? Image.network(
                            userProvider.userModel!.user!.profilePic.toString(),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/profile1.jpg',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            userProvider.userModel!.user!.name.toString(),
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff2c3131),
            ),
          ),
          Text(
            'View',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.blueColor,
            ),
          ),
          SizedBox(width: 250, child: Divider(color: Colors.grey.shade300)),
          // ListTile Section
          ..._buildDrawerList(context),
        ],
      ),
    ),
  );
}

List<Widget> _buildDrawerList(BuildContext context) {
  final drawerProvider = context.watch<DrawerProvider>();
  final selectedIndex = drawerProvider.selectedIndex;

  final List<Map<String, dynamic>> drawerItems = [
    {
      'icon': 'assets/icons/bookings.svg',
      'title': 'My bookings',
      'onTap': () {
        context.router.push(BookingsScreenRoute());
      },
    },
    {
      'icon': 'assets/icons/password.svg',
      'title': 'Change password',
      'onTap': () {
        context.read<BottomBarProvider>().updateIndex(3);
      },
    },
    {
      'icon': 'assets/icons/settings.svg',
      'title': 'Setting',
      'onTap': () {},
    },
    {
      'icon': 'assets/icons/location.svg',
      'title': 'Location',
      'onTap': () {
        context.router.push(LoactionScreenRoute());
      },
    },
    {
      'icon': 'assets/icons/contact.svg',
      'title': 'Contact Us',
      'onTap': () {
        context.read<BottomBarProvider>().updateIndex(2);
      },
    },
    {
      'icon': 'assets/icons/about.svg',
      'title': 'About',
      'onTap': () {
        context.router.push(AboutAppScreenRoute());
      },
    },
  ];

  return List.generate(drawerItems.length, (index) {
    final item = drawerItems[index];
    final isSelected = selectedIndex == index;

    return ListTile(
      leading: SvgPicture.asset(
        item['icon'],
        // color: isSelected ? AppColors.blueColor : null,
      ),
      title: Text(
        item['title'],
        style: TextStyle(
          color: isSelected ? AppColors.logocontainerColor : Colors.black,
        ),
      ),
      onTap: () {
        context.read<DrawerProvider>().setSelectedIndex(index);
        item['onTap']();
      },
    );
  });
}
