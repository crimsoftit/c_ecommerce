import 'package:duara_ecommerce/features/shop/screens/home/home.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavMenuController());
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80.0,
          elevation: 0,
          selectedIndex: navController.selectedIndex.value,
          onDestinationSelected: (index) {
            navController.selectedIndex.value = index;
          },
          backgroundColor:
              isDark ? RColors.rBrown : RColors.rBrown.withOpacity(0.1),
          indicatorColor: isDark
              ? RColors.rBrown.withOpacity(0.1)
              : RColors.rBrown.withOpacity(0.3),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'store',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'wishlist',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'profile',
            ),
          ],
        ),
      ),
      body: Obx(() => navController.screens[navController.selectedIndex.value]),
    );
  }
}

class NavMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.brown,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
}
