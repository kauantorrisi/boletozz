import 'package:boletozz/app_imports.dart';
part 'bill_model.g.dart';

@HiveType(typeId: 0)
class BillModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String emittingBank;

  @HiveField(2)
  String code;

  @HiveField(3)
  bool isPaid;

  @HiveField(4)
  double value;

  @HiveField(5)
  DateTime dueDate;

  @HiveField(6)
  DateTime? paymentDate;

  BillModel({
    required this.name,
    required this.emittingBank,
    required this.code,
    this.isPaid = false,
    required this.value,
    required this.dueDate,
    this.paymentDate,
  });

  factory BillModel.fromJson(Map<dynamic, dynamic> json) {
    return BillModel(
      name: json['name'],
      value: json['value'],
      dueDate: json['dueDate'],
      paymentDate: json['paymentDate'],
      emittingBank: json['emittingBank'],
      code: json['code'],
      isPaid: json['isPaid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'dueDate': dueDate,
      'paymentDate': paymentDate,
      'emittingBank': emittingBank,
      'code': code,
      'status': isPaid,
    };
  }
}
