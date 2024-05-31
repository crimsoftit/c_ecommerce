import 'package:duara_ecommerce/features/shop/models/product_model.dart';
import 'package:duara_ecommerce/features/shop/models/product_variations_model.dart';
import 'package:get/get.dart';

class CVariationController extends GetxController {
  static CVariationController get instance => Get.find();

  /// -- variables --
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<CProductVariationsModel> selectedVariation =
      CProductVariationsModel.empty().obs;

  /// -- select product attribute & variation --
  void onAttributeSelected(
      CProductModel product, attributeName, attributeValue) {
    // upon attribute selection, first add it to the selectedAttributes map
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
  }

  /// -- check product variation stock status --
  bool _attributeValuesMatch(Map<String, dynamic> variationAtrributes,
      Map<String, dynamic> selectedAttributes) {
    // if selectedAttributes.length = 3 yet current variation contains 2 variations return false
    if (variationAtrributes.length != selectedAttributes.length) return false;
    for (final key in variationAtrributes.keys) {
      if (variationAtrributes[key] != selectedAttributes[key]) return false;
    }
  }

  /// -- check product variation stock status --
  Set<String?> getAttributesAvailabilityInVariation(
      List<CProductVariationsModel> variations, String attributeName) {}

  /// -- check product variation stock status --
  void fetchPVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stockCount > 0
        ? 'in stock...'
        : 'out of stock...';
  }

  /// -- reset selected attributes when switching products --
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = CProductVariationsModel.empty();
  }
}
