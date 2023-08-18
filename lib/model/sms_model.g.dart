// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmsModelAdapter extends TypeAdapter<SmsModel> {
  @override
  final int typeId = 0;

  @override
  SmsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmsModel(
      id: fields[1] as int?,
      address: fields[2] as String?,
      body: fields[3] as String?,
      date: fields[4] as int?,
      dateSent: fields[5] as int?,
      read: fields[6] as bool?,
      seen: fields[7] as bool?,
      subject: fields[8] as String?,
      subscriptionId: fields[9] as int?,
      threadId: fields[10] as int?,
      serviceCenterAddress: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SmsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.body)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.dateSent)
      ..writeByte(6)
      ..write(obj.read)
      ..writeByte(7)
      ..write(obj.seen)
      ..writeByte(8)
      ..write(obj.subject)
      ..writeByte(9)
      ..write(obj.subscriptionId)
      ..writeByte(10)
      ..write(obj.threadId)
      ..writeByte(11)
      ..write(obj.serviceCenterAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
