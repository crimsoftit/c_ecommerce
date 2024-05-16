import 'package:cloud_firestore/cloud_firestore.dart';

class CCategoriesModel {
  CCategoriesModel({
    required this.id,
    required this.pName,
    required this.pImg,
    required this.isFeatured,
    this.parentId = '',
  });

  String id, pName, pImg, parentId;
  bool isFeatured;

  /// -- empty helper function --
  static CCategoriesModel empty() => CCategoriesModel(
        id: '',
        pName: '',
        pImg: '',
        isFeatured: false,
      );

  /// -- convert model to Json structure to store data --
  Map<String, dynamic> toJson() {
    return {
      'productName': pName,
      'productImage': pImg,
      'isFeatured': isFeatured,
      'parentId': parentId,
    };
  }

  /// -- map Json oriented document snapshot from Firebase to UserModel --
  factory CCategoriesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      // -- map JSON record to the CCategories model --
      return CCategoriesModel(
        id: document.id,
        pName: data!['productName'] ?? '',
        pImg: data['productImage'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        parentId: data['parentId'] ?? '',
      );
    } else {
      return CCategoriesModel.empty();
    }
  }
}
