import 'package:hive_flutter/hive_flutter.dart';
import 'package:telephony/telephony.dart';

part 'sms_model.g.dart';

@HiveType(typeId: 0)
class SmsModel extends HiveObject {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? address;
  @HiveField(3)
  String? body;
  @HiveField(4)
  int? date;
  @HiveField(5)
  int? dateSent;
  @HiveField(6)
  bool? read;
  @HiveField(7)
  bool? seen;
  @HiveField(8)
  String? subject;
  @HiveField(9)
  int? subscriptionId;
  @HiveField(10)
  int? threadId;
  @HiveField(11)
  String? serviceCenterAddress;

  SmsModel({
    this.id,
    this.address,
    this.body,
    this.date,
    this.dateSent,
    this.read,
    this.seen,
    this.subject,
    this.subscriptionId,
    this.threadId,
    this.serviceCenterAddress,
  });

  SmsModel.from(SmsMessage message) {
    id = message.id;
    address = message.address;
    body = message.body;
    date = message.date;
    dateSent = message.dateSent;
    read = message.read;
    seen = message.seen;
    subject = message.subject;
    subscriptionId = message.subscriptionId;
    threadId = message.threadId;
    serviceCenterAddress = message.serviceCenterAddress;
  }
}
