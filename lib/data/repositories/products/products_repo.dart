import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duara_ecommerce/data/services/firebase_storage_services.dart';
import 'package:duara_ecommerce/features/shop/models/product_model.dart';
import 'package:duara_ecommerce/utils/constants/enums.dart';
import 'package:duara_ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:duara_ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CProductsRepo extends GetxController {
  static CProductsRepo get instance => Get.find();

  /// -- firestore instance for db interaction --
  final _db = FirebaseFirestore.instance;

  /// -- get limited featured products --
  Future<List<CProductModel>> fetchFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => CProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw CFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw CPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong! ${e.toString()}';
    }
  }

  /// -- upload dummy data to the firestore cloud --
  Future<void> uploadDummyData(List<CProductModel> products) async {
    try {
      final storage = Get.put(CFirebaseStorageServices());

      // -- loop through each product
      for (var product in products) {
        // get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and retreive it's url
        final imgUrl = await storage.uploadImageData(
          'products/images',
          thumbnail,
          product.thumbnail.toString(),
        );

        // assign image url to product.thumbnail attribute
        product.thumbnail = imgUrl;

        // product images list
        if (product.pImages != null && product.pImages!.isNotEmpty) {
          List<String> imgUrls = [];
          for (var image in product.pImages!) {
            // get image data links from local assets
            final assetImg = await storage.getImageDataFromAssets(image);

            // upload image & get its url
            final imgUrl = await storage.uploadImageData(
              'products/images',
              assetImg,
              image,
            );

            // assign image url to product.thumbnail attribute
            imgUrls.add(imgUrl);
          }

          product.pImages!.clear();
          product.pImages!.addAll(imgUrls);
        }

        // upload variation images
        if (product.productType == CProductType.variable.toString()) {
          for (var variation in product.pVariations!) {
            // get image data link from local assets
            final assetImg =
                await storage.getImageDataFromAssets(variation.pImage);

            // upload image and get its url
            final imgUrl = await storage.uploadImageData(
              'products/images',
              assetImg,
              variation.pImage,
            );

            // assign imgUrl to variation.pImage attribute
            variation.pImage = imgUrl;
          }
        }

        // store product details in cloud firestore database
        await _db.collection('products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
