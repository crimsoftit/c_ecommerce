import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CAddNewAddressesScren extends StatelessWidget {
  const CAddNewAddressesScren({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'add new address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: CColors.rBrown,
                    ),
                    labelText: 'name',
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBtnInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.mobile,
                      color: CColors.rBrown,
                    ),
                    labelText: 'phone no.',
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBtnInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.building_31,
                            color: CColors.rBrown,
                          ),
                          labelText: 'street',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: CSizes.spaceBtnInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.code,
                            color: CColors.rBrown,
                          ),
                          labelText: 'postal code',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: CSizes.spaceBtnInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.building,
                            color: CColors.rBrown,
                          ),
                          labelText: 'city',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: CSizes.spaceBtnInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.activity,
                            color: CColors.rBrown,
                          ),
                          labelText: 'state',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: CSizes.spaceBtnInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.global,
                      color: CColors.rBrown,
                    ),
                    labelText: 'country',
                  ),
                ),
                const SizedBox(
                  height: CSizes.defaultSpace,
                ),
                // - checkout button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'save'.toUpperCase(),
                      style: Theme.of(context).textTheme.labelMedium?.apply(
                            color: CColors.white,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBtnSections,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
