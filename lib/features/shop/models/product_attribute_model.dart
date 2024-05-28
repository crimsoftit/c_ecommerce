class CProductAttributeModel {
  String? pName;
  final List<String>? pValues;

  CProductAttributeModel({
    this.pName,
    this.pValues,
  });

  /// -- empty helper function --
  static CProductAttributeModel empty() {
    return CProductAttributeModel(
      pName: '',
      pValues: [],
    );
  }

  /// -- convert to Json format --
  toJson() {
    return {
      'productName': pName,
      'productValues': pValues,
    };
  }

  /// -- map jSon document snapshot from Firebase to UserModel --
  factory CProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) {
      return CProductAttributeModel.empty();
    } else {
      return CProductAttributeModel(
        pName: data.containsKey('productName') ? data['productName'] : '',
        pValues: List<String>.from(data['productValues']),
      );
    }
  }
}
