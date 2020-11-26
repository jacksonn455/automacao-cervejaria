import 'package:onesignal_flutter/onesignal_flutter.dart';

class BlocHome{

  void initOneSignal(){
    OneSignal.shared.init("43e41c97-0644-4ce1-aaba-5211f239a2c7");
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
  }
}