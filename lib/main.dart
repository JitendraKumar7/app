import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';
import 'package:telephony/telephony.dart';

import 'model/sms_model.dart';

final telephony = Telephony.instance;

onBackgroundMessage(SmsMessage message) async {
  debugPrint("onBackgroundMessage called");

  try {
    await Utils.instance.init;

    var model = SmsModel.from(message);
    await Utils.instance.add(model);
  } catch (err) {
    debugPrint("onBackgroundMessage $err");
  }
}

/// -->

class Utils {
  late Box<SmsModel> box;

  Utils._();

  static final instance = Utils._();

  Future<bool> get init async {
    await Hive.initFlutter('TelephonyApp001');
    Hive.registerAdapter(SmsModelAdapter());
    box = await Hive.openBox<SmsModel>('MessageInbox');
    return true;
  }

  add(SmsModel model) async {
    await box.add(model);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Utils.instance.init;

  /// entered in app
  runApp(const TelephonyApp());
}

class TelephonyApp extends StatefulWidget {
  const TelephonyApp({super.key});

  @override
  State<TelephonyApp> createState() => _TelephonyAppState();
}

class _TelephonyAppState extends State<TelephonyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  onMessage(SmsMessage message) async {
    debugPrint('SmsModel ==> ${message.body}');
    var model = SmsModel.from(message);
    Utils.instance.add(model);
  }

  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.listenIncomingSms(
        onBackgroundMessage: onBackgroundMessage,
        onNewMessage: onMessage,
      );
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TelephonyApp')),
        body: ValueListenableBuilder(
          valueListenable: Utils.instance.box.listenable(),
          builder: (context, value, child) {
            return ListView.separated(
              reverse: true,
              itemBuilder: (context, index) {
                var model = value.getAt(index);
                return ListTile(title: Text('${model?.body}'));
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: value.length,
            );
          },
        ),
      ),
    );
  }
}
