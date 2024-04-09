import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_circular_img.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/features/personalization/screens/profile/widgets/c_profile_menu.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'me profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // -- body --
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // -- profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CRoundedContainer(
                      showBorder: true,
                      radius: 100,
                      borderColor: CColors.rBrown.withOpacity(0.3),
                      child: Stack(
                        children: [
                          const CCircularImg(
                            img: CImages.user,
                            width: 60.0,
                            height: 60.0,
                            padding: 10.0,
                          ),
                          Positioned(
                            right: 2,
                            bottom: 3,
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Iconsax.edit,
                                  size: 18.0,
                                  color: CColors.rBrown.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtnItems / 4,
                    ),
                    Text(
                      'Retail Intelligence',
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: CColors.darkGrey,
                          ),
                    ),

                    const SizedBox(
                      height: CSizes.spaceBtnItems / 2,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: CSizes.spaceBtnItems,
                    ),

                    // -- profile details
                    const CSectionHeading(
                      showActionBtn: false,
                      title: 'profile info...',
                      btnTitle: '',
                      editFontSize: false,
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtnItems,
                    ),

                    CProfileMenu(
                      title: 'business name',
                      value: 'crimsoft inc.',
                      onTap: () {},
                    ),

                    CProfileMenu(
                      title: 'username',
                      value: 'retail intelligence',
                      onTap: () {},
                    ),

                    const SizedBox(
                      height: CSizes.spaceBtnItems / 2,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: CSizes.spaceBtnItems,
                    ),

                    // -- personal info headings
                    const CSectionHeading(
                      showActionBtn: false,
                      title: 'personal info...',
                      btnTitle: '',
                      editFontSize: false,
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtnItems,
                    ),

                    CProfileMenu(
                      title: 'user id',
                      value: '30010010',
                      icon: Iconsax.copy,
                      onTap: () {},
                    ),
                    CProfileMenu(
                      title: 'e-mail',
                      value: 'crimsoft47@gmail.com',
                      onTap: () {},
                    ),
                    CProfileMenu(
                      title: 'phone no.',
                      value: '+254 746 683 781',
                      onTap: () {},
                    ),
                    CProfileMenu(
                      title: 'gender',
                      value: 'male',
                      onTap: () {},
                    ),
                    CProfileMenu(
                      title: 'dob.',
                      value: '8 Aug, 2000',
                      onTap: () {},
                    ),
                    const Divider(),
                    const SizedBox(
                      height: CSizes.spaceBtnItems,
                    ),

                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'close my account',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
