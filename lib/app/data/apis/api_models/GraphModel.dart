import 'dart:convert';

CostListRes costListResFromJson(String str) =>
    CostListRes.fromJson(json.decode(str));

String costListResToJson(CostListRes data) => json.encode(data.toJson());

class CostListRes {
  CostListRes({
    String? message,
    String? status,
    List<Years>? years,
  }) {
    _message = message;
    _status = status;
    _years = years;
  }

  CostListRes.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['years'] != null) {
      _years = [];
      json['years'].forEach((v) {
        _years?.add(Years.fromJson(v));
      });
    }
  }

  String? _message;
  String? _status;
  List<Years>? _years;

  CostListRes copyWith({
    String? message,
    String? status,
    List<Years>? years,
  }) =>
      CostListRes(
        message: message ?? _message,
        status: status ?? _status,
        years: years ?? _years,
      );

  String? get message => _message;

  String? get status => _status;

  List<Years>? get years => _years;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_years != null) {
      map['years'] = _years?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "2023"
/// data : [{"id":"1","client_id":"1","year":"2023","month":"january","month_code":"0","created_at":"2023-12-01 12:45:55","updated_at":"2023-12-01 12:45:55","amount":"200.00"},{"id":"2","client_id":"1","year":"2023","month":"february","month_code":"1","created_at":"2023-12-01 12:46:25","updated_at":"2023-12-07 13:05:12","amount":"300.00"},{"id":"7","client_id":"1","year":"2023","month":"september","month_code":"8","created_at":"2023-12-07 13:17:56","updated_at":"2023-12-07 18:52:57","amount":"300.00"},{"id":"8","client_id":"1","year":"2023","month":"april","month_code":"3","created_at":"2023-12-07 13:20:06","updated_at":"2023-12-07 18:53:01","amount":"344.00"},{"id":"9","client_id":"1","year":"2023","month":"may","month_code":"4","created_at":"2023-12-07 13:20:20","updated_at":"2023-12-07 18:53:05","amount":"344.00"},{"id":"10","client_id":"1","year":"2023","month":"june","month_code":"5","created_at":"2023-12-07 13:20:33","updated_at":"2023-12-07 13:29:48","amount":"343.00"}]
/// grand_total : {"client_id":"1","year":"2023","total":1831}

Years yearsFromJson(String str) => Years.fromJson(json.decode(str));

String yearsToJson(Years data) => json.encode(data.toJson());

class Years {
  Years({
    String? name,
    List<Data>? data,
    GrandTotal? grandTotal,
  }) {
    _name = name;
    _data = data;
    _grandTotal = grandTotal;
  }

  Years.fromJson(dynamic json) {
    _name = json['name'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _grandTotal = json['grand_total'] != null
        ? GrandTotal.fromJson(json['grand_total'])
        : null;
  }

  String? _name;
  List<Data>? _data;
  GrandTotal? _grandTotal;

  Years copyWith({
    String? name,
    List<Data>? data,
    GrandTotal? grandTotal,
  }) =>
      Years(
        name: name ?? _name,
        data: data ?? _data,
        grandTotal: grandTotal ?? _grandTotal,
      );

  String? get name => _name;

  List<Data>? get data => _data;

  GrandTotal? get grandTotal => _grandTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_grandTotal != null) {
      map['grand_total'] = _grandTotal?.toJson();
    }
    return map;
  }
}

/// client_id : "1"
/// year : "2023"
/// total : 1831

GrandTotal grandTotalFromJson(String str) =>
    GrandTotal.fromJson(json.decode(str));

String grandTotalToJson(GrandTotal data) => json.encode(data.toJson());

class GrandTotal {
  GrandTotal({
    String? clientId,
    String? year,
    String? total,
    String? average,
  }) {
    _clientId = clientId;
    _year = year;
    _total = total;
  }

  GrandTotal.fromJson(dynamic json) {
    _clientId = json['client_id'];
    _year = json['year'];
    _total = json['total'];
    _average = json['average'];
  }

  String? _clientId;
  String? _year;
  String? _total;
  String? _average;

  GrandTotal copyWith({
    String? clientId,
    String? year,
    String? total,
    String? average,
  }) =>
      GrandTotal(
        clientId: clientId ?? _clientId,
        year: year ?? _year,
        total: total ?? _total,
        average: total ?? _average,
      );

  String? get clientId => _clientId;

  String? get year => _year;

  String? get total => _total;

  String? get average => _average;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_id'] = _clientId;
    map['year'] = _year;
    map['total'] = _total;
    map['average'] = _average;
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? clientId,
    String? year,
    String? month,
    int? monthCode,
    String? createdAt,
    String? updatedAt,
    double? amount,
  }) {
    _id = id;
    _clientId = clientId;
    _year = year;
    _month = month;
    _monthCode = monthCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _amount = amount;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _clientId = json['client_id'];
    _year = json['year'];
    _month = json['month'];
    _monthCode = int.tryParse(json['month_code']);
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _amount = double.tryParse(removeHyphens(json['amount']));
  }

  String removeHyphens(String inputString) {
    return inputString.replaceAll('-', '');
  }

  String? _id;
  String? _clientId;
  String? _year;
  String? _month;
  int? _monthCode;
  String? _createdAt;
  String? _updatedAt;
  double? _amount;

  Data copyWith({
    String? id,
    String? clientId,
    String? year,
    String? month,
    int? monthCode,
    String? createdAt,
    String? updatedAt,
    double? amount,
  }) =>
      Data(
        id: id ?? _id,
        clientId: clientId ?? _clientId,
        year: year ?? _year,
        month: month ?? _month,
        monthCode: monthCode ?? _monthCode,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        amount: amount ?? _amount,
      );

  String? get id => _id;

  String? get clientId => _clientId;

  String? get year => _year;

  String? get month => _month;

  int? get monthCode => _monthCode;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  double? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['client_id'] = _clientId;
    map['year'] = _year;
    map['month'] = _month;
    map['month_code'] = _monthCode;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['amount'] = _amount;
    return map;
  }
}
