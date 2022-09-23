library push_service;

import 'package:push_service_interface/push_service_interface.dart';

import 'package:huawei_push/huawei_push.dart';


class HmsPushService extends PushServiceInterface {
  String? token;

  @override
  Future<void> init() async {
    print("llego");
    await Push.setAutoInitEnabled(true);
    _initTokenStream();
    Push.onMessageReceivedStream.listen(_onMessageReceived);
  }

  void _onMessageReceived(RemoteMessage remoteMessage) {
    print(remoteMessage.data);
  }

   void _initTokenStream()  {
     print("llego2");
    Push.getTokenStream.listen((event) => {
      _onTokenEvent(event)
    });
  }

  void _onTokenEvent(String event) {
    print("llego3");
    Push.getToken("");
    token = event;
    print("Token: $token");
  }


}