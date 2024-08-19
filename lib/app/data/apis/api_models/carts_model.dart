class CartsModel {
  List<Cart>? cart;
  int? subTotal;
  int? tax;
  int? total;
  String? totalAmount;
  String? message;
  String? status;

  CartsModel(
      {this.cart,
      this.subTotal,
      this.tax,
      this.total,
      this.totalAmount,
      this.message,
      this.status});

  CartsModel.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(Cart.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    tax = json['tax'];
    total = json['total'];
    totalAmount = json['total_amount'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    }
    data['sub_total'] = subTotal;
    data['tax'] = tax;
    data['total'] = total;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Cart {
  String? cartId;
  String? cartProductId;
  String? cartOrderId;
  String? cartUserId;
  String? cartQuantity;
  ProductData? productData;

  Cart(
      {this.cartId,
      this.cartProductId,
      this.cartOrderId,
      this.cartUserId,
      this.cartQuantity,
      this.productData});

  Cart.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartProductId = json['cart_product_id'];
    cartOrderId = json['cart_order_id'];
    cartUserId = json['cart_user_id'];
    cartQuantity = json['cart_quantity'];
    productData = json['product_data'] != null
        ? ProductData.fromJson(json['product_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['cart_product_id'] = cartProductId;
    data['cart_order_id'] = cartOrderId;
    data['cart_user_id'] = cartUserId;
    data['cart_quantity'] = cartQuantity;
    if (productData != null) {
      data['product_data'] = productData!.toJson();
    }
    return data;
  }
}

class ProductData {
  String? productId;
  String? productName;
  String? productPrice;
  String? productPriceFinal;
  String? productImage;
  String? productCategoryId;
  String? productUnit;
  String? productUnitMeasure;
  String? productDescription;

  ProductData(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productPriceFinal,
      this.productImage,
      this.productCategoryId,
      this.productUnit,
      this.productUnitMeasure,
      this.productDescription});

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productPriceFinal = json['product_price'];
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
