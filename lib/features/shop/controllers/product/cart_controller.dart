import 'package:duara_ecommerce/features/shop/controllers/product/p_variation_controller.dart';
import 'package:duara_ecommerce/features/shop/models/cart_item_model.dart';
import 'package:duara_ecommerce/features/shop/models/product_model.dart';
import 'package:duara_ecommerce/utils/constants/enums.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:get/get.dart';

class CCartController extends GetxController {
	static CCartController get instance => Get.find();

	/// -- variables --
	RxInt noOfCartItems = 0.obs;
	RxDouble totalCartPrice = 0.0.obs;
	RxInt pQuantityInCart = 0.obs;
	RxList<CCartItemModel> cartItems = <CCartItemModel>[].obs;
	final variationController = CVariationController.instance;

	/// -- add items to cart --
	void addItemToCart (CProductModel product) {
		// item qty check
		if (pQuantityInCart.value < 1) {
			CPopupSnackBar.customToast(message: 'select quantity',);
			return;
		}

		// product variation check (if is selected or not)
		if (product.productType == CProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty) {
			CPopupSnackBar.customToast(message: 'select variation (e.g. color, size)...');
			return;
		}

		// check stock status
		if (product.productType == CProductType.variable.toString()) {
			if (variationController.selectedVariation.value.stockCount < 1) {
				CPopupSnackBar.warningSnackBar(title: 'Oh Snap!', message: 'products with selected variation are out of stock',);
			}
		} else {
		  
		}
	}
}