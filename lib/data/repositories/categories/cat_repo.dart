import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duara_ecommerce/data/services/firebase_storage_services.dart';
import 'package:duara_ecommerce/features/shop/models/categories_model.dart';
import 'package:duara_ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:duara_ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:duara_ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CCategoriesRepo extends GetxController {
  static CCategoriesRepo get instance => Get.find();

  // -- variables --
  final _db = FirebaseFirestore.instance;

  // -- fetch all cateogries --
  Future<List<CCategoriesModel>> fetchAllCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      final productsList = snapshot.docs
          .map((document) => CCategoriesModel.fromSnapshot(document))
          .toList();
      return productsList;
    } on FirebaseAuthException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebaseAuth exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebase exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FormatException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.message,
      );
      throw CFormatExceptions(e.message);
    } on PlatformException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.code.toString(),
      );
      throw CPlatformExceptions(e.code).message;
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "An error occurred",
        message: e.toString(),
      );
      throw 'something went wrong! please try again!';
    }
  }

  // -- fetch sub-categories

  // -- upload categories to firebase firestore cloud --
  Future<void> uploadDummyData(List<CCategoriesModel> categories) async {
    try {
      // - upload all product categories with their images
      final storage = Get.put(CFirebaseStorageServices());

      // - loop through each category
      for (var category in categories) {
        // get image url from local assets
        final file = await storage.getImageDataFromAssets(category.cImg);

        // upload image and retrieve its url
        final imgUrl =
            await storage.uploadImageData('categories', file, category.cName);

        // assign url to category.img attribute
        category.cImg = imgUrl;

        // store category in firebase firestore database
        await _db
            .collection('categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseAuthException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebaseAuth exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebase exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FormatException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.message,
      );
      throw CFormatExceptions(e.message);
    } on PlatformException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.code.toString(),
      );
      throw CPlatformExceptions(e.code).message;
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "An error occurred",
        message: e.toString(),
      );
      throw 'something went wrong! please try again!';
    }
  }
}
