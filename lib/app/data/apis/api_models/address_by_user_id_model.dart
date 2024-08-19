class AddressByUserIdModel {
  List<Address>? address;
  String? message;
  String? status;

  AddressByUserIdModel({this.address, this.message, this.status});

  AddressByUserIdModel.fromJson(Map<String, dynamic> json) {
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Address {
  String? addressId;
  String? addressName;
  String? addressStreetAddress;
  String? addressCity;
  String? addressState;
  String? addressPostalCode;
  String? addressCountry;
  String? addressPhoneNumber;
  String? addressEmail;
  String? addressCreatedAt;
  String? addressUpdatedAt;
  String? addressUserId;

  Address(
      {this.addressId,
      this.addressName,
      this.addressStreetAddress,
      this.addressCity,
      this.addressState,
      this.addressPostalCode,
      this.addressCountry,
      this.addressPhoneNumber,
      this.addressEmail,
      this.addressCreatedAt,
      this.addressUpdatedAt,
      this.addressUserId});

  Address.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressStreetAddress = json['address_street_address'];
    addressCity = json['address_city'];
    addressState = json['address_state'];
    addressPostalCode = json['address_postal_code'];
    addressCountry = json['address_country'];
    addressPhoneNumber = json['address_phone_number'];
    addressEmail = json['address_email'];
    addressCreatedAt = json['address_created_at'];
    addressUpdatedAt = json['address_updated_at'];
    addressUserId = json['address_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_street_address'] = addressStreetAddress;
    data['address_city'] = addressCity;
    data['address_state'] = addressState;
    data['address_postal_code'] = addressPostalCode;
    data['address_country'] = addressCountry;
    data['address_phone_number'] = addressPhoneNumber;
    data['address_email'] = addressEmail;
    data['address_created_at'] = addressCreatedAt;
    data['address_updated_at'] = addressUpdatedAt;
    data['address_user_id'] = addressUserId;
    return data;
  }
}
