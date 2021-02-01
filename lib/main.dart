import 'package:flutter/material.dart';

import 'app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///----------------For Jio----------------

  /* final SmsSender sender =  SmsSender();
  const String address = '199';
  final SmsMessage message =  SmsMessage(address, 'BAL');
  sender.sendSms(message);
  final SmsReceiver receiver = SmsReceiver();
  receiver.onSmsReceived.listen((SmsMessage msg) {
    final String totalGB = msg.body.split(':')[3].split('GB')[1].split('of').last;
    final String remainingGB = msg.body.split(':')[3].split('GB')[0];
    print('${remainingGB}GB/${totalGB}GB');
  });
  */
  runApp(MyApp());
}
