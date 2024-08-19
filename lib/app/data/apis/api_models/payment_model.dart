class PaymentModel {
  Result? result;
  String? message;
  String? status;

  PaymentModel({this.result, this.message, this.status});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? amount;
  String? customerName;
  String? description;
  String? referenceNumber;
  String? paymentIntent;
  String? collectionId;
  String? txnId;
  String? externalTxnId;
  String? response;
  String? authCode;
  String? authNumber;
  String? fpxBuyerName;
  String? fpxBuyerBankId;
  String? fpxBuyerBankName;
  String? cardHolderName;
  String? cardNumber;
  String? cardExpiry;
  String? cardBrand;
  String? cardIssuer;
  String? signature;
  String? cardOnFile;
  String? txnType;
  String? nonce;
  String? metadata;

  Result(
      {this.amount,
      this.customerName,
      this.description,
      this.referenceNumber,
      this.paymentIntent,
      this.collectionId,
      this.txnId,
      this.externalTxnId,
      this.response,
      this.authCode,
      this.authNumber,
      this.fpxBuyerName,
      this.fpxBuyerBankId,
      this.fpxBuyerBankName,
      this.cardHolderName,
      this.cardNumber,
      this.cardExpiry,
      this.cardBrand,
      this.cardIssuer,
      this.signature,
      this.cardOnFile,
      this.txnType,
      this.nonce,
      this.metadata});

  Result.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    customerName = json['customer_name'];
    description = json['description'];
    referenceNumber = json['reference_number'];
    paymentIntent = json['payment_intent'];
    collectionId = json['collection_id'];
    txnId = json['txn_id'];
    externalTxnId = json['external_txn_id'];
    response = json['response'];
    authCode = json['auth_code'];
    authNumber = json['auth_number'];
    fpxBuyerName = json['fpx_buyer_name'];
    fpxBuyerBankId = json['fpx_buyer_bank_id'];
    fpxBuyerBankName = json['fpx_buyer_bank_name'];
    cardHolderName = json['card_holder_name'];
    cardNumber = json['card_number'];
    cardExpiry = json['card_expiry'];
    cardBrand = json['card_brand'];
    cardIssuer = json['card_issuer'];
    signature = json['signature'];
    cardOnFile = json['card_on_file'];
    txnType = json['txn_type'];
    nonce = json['nonce'];
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['customer_name'] = customerName;
    data['description'] = description;
    data['reference_number'] = referenceNumber;
    data['payment_intent'] = paymentIntent;
    data['collection_id'] = collectionId;
    data['txn_id'] = txnId;
    data['external_txn_id'] = externalTxnId;
    data['response'] = response;
    data['auth_code'] = authCode;
    data['auth_number'] = authNumber;
    data['fpx_buyer_name'] = fpxBuyerName;
    data['fpx_buyer_bank_id'] = fpxBuyerBankId;
    data['fpx_buyer_bank_name'] = fpxBuyerBankName;
    data['card_holder_name'] = cardHolderName;
    data['card_number'] = cardNumber;
    data['card_expiry'] = cardExpiry;
    data['card_brand'] = cardBrand;
    data['card_issuer'] = cardIssuer;
    data['signature'] = signature;
    data['card_on_file'] = cardOnFile;
    data['txn_type'] = txnType;
    data['nonce'] = nonce;
    data['metadata'] = metadata;
    return data;
  }
}
