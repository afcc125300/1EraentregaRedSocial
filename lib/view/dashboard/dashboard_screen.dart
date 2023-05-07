

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/view/dashboard/profile/profile.dart';
import 'package:tech_media/view/dashboard/user/user_list_screen.dart';
import 'package:tech_media/view_model/services/sesion_manager.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>{

  final controler = PersistentTabController(initialIndex: 0);

  List<Widget>_buildScren(){
    return[
      SafeArea(child: Text('Home' , style: Theme.of(context).textTheme.subtitle1,)),
      Text('Chat'),
      Text('Add'),
      UserListScreen(),
      ProfileScreen(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
     PersistentBottomNavBarItem(
         icon: Icon(Icons.home ),
      activeColorPrimary: AppColors.primaryIconColor,
      inactiveIcon:Icon(Icons.home , color: AppColors.textFieldDefaultBorderColor,)

     ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.message),
          activeColorPrimary: AppColors.primaryIconColor,
    inactiveIcon: Icon(Icons.message , color: Colors.grey.shade100,)

      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add),
          activeColorPrimary: AppColors.primaryIconColor,
    inactiveIcon: Icon(Icons.add , color: Colors.grey.shade100,)

    ),

      PersistentBottomNavBarItem(
          icon: Icon(Icons.message),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.add , color: Colors.grey.shade100,)

      ),

      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.person, color: Colors.grey.shade100,)
    ),

    ];
  }

  @override
Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        screens: _buildScren(),
      items: _navBarItem(),
      controller: controler,
      backgroundColor: AppColors.otpHintColor,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.red,
        borderRadius: BorderRadius.circular(1)
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
