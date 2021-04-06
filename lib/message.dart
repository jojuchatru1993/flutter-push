import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageArguments {
  final RemoteMessage message;

  final bool openedApplication;

  MessageArguments(this.message, this.openedApplication)
      : assert(message != null);
}

class MessageView extends StatelessWidget {
  Widget row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(children: [
        Text('$title: '),
        Text(value ?? 'N/A'),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MessageArguments args = ModalRoute.of(context).settings.arguments;
    RemoteMessage message = args.message;
    RemoteNotification notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: Text(notification.title),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          if (notification != null) ...[
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(children: [
                  const Text(
                    'Notification',
                    style: TextStyle(fontSize: 18),
                  ),
                  row(
                    'Title',
                    notification.title,
                  ),
                  row(
                    'Body',
                    notification.body,
                  ),
                ]))
          ]
        ]),
      )),
    );
  }
}
