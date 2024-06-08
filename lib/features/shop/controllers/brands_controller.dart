import 'package:duara_ecommerce/data/repositories/brands/brands_repo.dart';
import 'package:duara_ecommerce/data/repositories/products/products_repo.dart';
import 'package:duara_ecommerce/features/shop/models/brands_model.dart';
import 'package:duara_ecommerce/features/shop/models/product_model.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:get/get.dart';

class CBrandsController extends GetxController {
  static CBrandsController get instance => Get.find();

  /// -- variables --
  RxBool isLoading = false.obs;
  final RxList<CBrandModel> allBrands = <CBrandModel>[].obs;
  final RxList<CBrandModel> featuredBrands = <CBrandModel>[].obs;
  final brandsRepo = Get.put(CBrandsRepo());

  @override
  void onInit() {
    fetchFeaturedBrands();
    super.onInit();
  }

  /// -- load featured brands from db --
  Future<void> fetchFeaturedBrands() async {
    try {
      // start loader
      isLoading.value = true;

      final brands = await brandsRepo.fetchAllBrands();

      // assign all brands
      allBrands.assignAll(brands);

      // retreive & assign featured brands
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    } finally {
      // stop loader
      isLoading.value = false;
    }
  }

  /// -- fetch brands for category --

  /// -- fetch brand-specific products from ua data source --
  Future<List<CProductModel>> fetchBrandProducts(String brandId) async {
    try {
      final bProducts =
          await CProductsRepo.instance.fetchProductsByBrand(bId: brandId);

      return bProducts;
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
      return [];
    }
  }
}
