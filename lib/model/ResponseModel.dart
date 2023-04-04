import 'dart:convert';

class ResponseModel {
  String? api_status;
  String? message;
  List<PaymentData>? Data;

  ResponseModel.Constructor({this.api_status,
    this.message,
     this.Data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel.Constructor(
      api_status: json['api_status'],
      message: json['message'],
      Data: (json['Data'] as List)
          .map((item) => PaymentData.fromJson(item))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    "api_status": api_status,
    "msg": message,
    "Data": Data,
  };
}


ResponseModel profileFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String profileToJson(ResponseModel data) => json.encode(data.toJson());
class PaymentData {
  String payment_code;
  String entry_dt;
  String entry_date;
  String payment_type;
  String dealer_code;
  String shop_name;
  String dealer_name;
  String mobile_no;
  String payment;
  String transaction_id;
  String remark;
  String login_code;
  String button_name;
  String parameter;
  String payment_status;

  PaymentData({
    required this.payment_code,
    required this.entry_dt,
    required this.entry_date,
    required this.payment_type,
    required this.dealer_code,
    required this.shop_name,
    required this.dealer_name,
    required this.mobile_no,
    required this.payment,
    required this.transaction_id,
    required this.remark,
    required this.login_code,
    required this.button_name,
    required this.parameter,
    required this.payment_status

  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      payment_code: json['payment_code'],
      entry_dt: json['entry_dt'],
      entry_date: json['entry_date'],
      payment_type: json['payment_type'],
      dealer_code: json['dealer_code'],
      shop_name: json['shop_name'],
      dealer_name: json['dealer_name'],
      mobile_no: json['mobile_no'],
      payment: json['payment'],
      transaction_id: json['transaction_id'],
      remark: json['remark'],
      login_code: json['login_code'],
      button_name: json['button_name'],
      parameter: json['parameter'],
      payment_status: json['payment_status'],
    );
  }


}