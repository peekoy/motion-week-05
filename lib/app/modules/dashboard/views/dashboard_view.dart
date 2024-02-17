import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli/app/modules/home/views/home_view.dart';
import 'package:get_cli/app/modules/profile/views/profile_view.dart';
import 'package:get_cli/app/modules/reels/views/reels_view.dart';
import 'package:get_cli/app/modules/search_page/views/search_page_view.dart';
import 'package:get_cli/app/modules/shopping/views/shopping_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'search_page',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined),
                label: 'reels',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: 'shopping',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'profile',
              ),
            ]
          ),
        );
      }
    );
  }
}
