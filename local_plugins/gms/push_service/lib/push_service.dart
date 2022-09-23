library push_service;

import "package:push_service_interface/push_service_interface.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class GmsPushService extends PushServiceInterface {

  String? token;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override

  @override
  Future<void> init() async {
    print("LLEGO!");
    await Firebase.initializeApp();

    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onBackgroundMessage(_backgroudHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    token = await FirebaseMessaging.instance.getToken();
    print(token);

  }


  Future _backgroudHandler(RemoteMessage remoteMessage) async {
    print(remoteMessage.data);
  }
  Future _onMessageHandler(RemoteMessage remoteMessage) async {
    print(remoteMessage.data);
  }
  Future _onMessageOpenApp(RemoteMessage remoteMessage) async {
    print(remoteMessage.data);
  }
}
