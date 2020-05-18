import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'model/message.dart';

class MessagingWidget extends StatefulWidget {
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
      final notification = message['notification'];
      setState(() {
        messages.add(Message(
          title: notification['title'], body: notification['body']));
      });
    }, 
    onLaunch: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    }, 
    onResume: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    });
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) => ListView(
        children: messages.map(buildMessage).toList(),
      );
  Widget buildMessage(Message message) => ListTile(
        title: Text(message.title),
        subtitle: Text(message.body),
      );
}
