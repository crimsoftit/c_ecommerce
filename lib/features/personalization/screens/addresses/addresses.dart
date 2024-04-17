import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/features/personalization/screens/addresses/add_new_address.dart';
import 'package:duara_ecommerce/features/personalization/screens/addresses/widgets/single_address.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CAddNewAddressesScren());
        },
        backgroundColor: CColors.rBrown,
        child: const Icon(
          Iconsax.add,
          color: CColors.white,
        ),
      ),
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'me addresses',
          style: Theme.of(context).textTheme.headlineSmall!.apply(
            fontSizeFactor: 0.8,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CSingleAddress(
                selectedAddress: false,
              ),
              CSingleAddress(
                selectedAddress: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
