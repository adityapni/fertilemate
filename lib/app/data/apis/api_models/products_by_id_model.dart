class ProductsByIdModel {
  Product? product;
  String? message;
  String? status;

  ProductsByIdModel({this.product, this.message, this.status});

  ProductsByIdModel.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Product {
  String? productId;
  String? productName;
  String? productPrice;
  String? productImage;
  String? productCategoryId;
  String? productUnit;
  String? productUnitMeasure;
  String? productDescription;

  Product(
      {this.productId,
        this.productName,
        this.productPrice,
        this.productImage,
        this.productCategoryId,
        this.productUnit,
        this.productUnitMeasure,
        this.productDescription});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    productCategoryId = json['product_category_id'];
    productUnit = json['product_unit'];
    productUnitMeasure = json['product_unit_measure'];
    productDescription = json['product_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_image'] = productImage;
    data['product_category_id'] = productCategoryId;
    data['product_unit'] = productUnit;
    data['product_unit_measure'] = productUnitMeasure;
    data['product_description'] = productDescription;
    return data;
  }
}
