import 'package:duara_ecommerce/data/repositories/categories/cat_repo.dart';
import 'package:duara_ecommerce/features/shop/models/categories_model.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:get/get.dart';

class CCatsController extends GetxController {
  static CCatsController get instance => Get.find();

  final isLoading = false.obs;
  final _catsRepo = Get.put(CCategoriesRepo());
  RxList<CCategoriesModel> allCategories = <CCategoriesModel>[].obs;
  RxList<CCategoriesModel> featuredCategories = <CCategoriesModel>[].obs;

  @override
  void onInit() {
    fetchAllCategories();
    super.onInit();
  }

  // -- load categories data --
  Future<void> fetchAllCategories() async {
    try {
      // show loader while product categories are fetched
      isLoading.value = true;

      // fetch categories from data source (Firestore, API, etc.)
      final pCats = await _catsRepo.fetchAllCategories();

      // update list of categories
      allCategories.assignAll(pCats);

      // filter featured product categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(10)
          .toList());
    } catch (e) {
      isLoading.value = false;
      CPopupSnackBar.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  // -- load selected categories data --

  // -- get category or sub-category products --
}
