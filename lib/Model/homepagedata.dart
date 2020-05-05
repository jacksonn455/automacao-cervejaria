import 'package:flutter/foundation.dart';
import 'package:velha_guarda/Model/homedatamodel.dart';
import 'package:velha_guarda/icons/my_flutter_app_icons.dart';


class HomePageData extends ChangeNotifier {
  List<UserInfoModel> userInfo = [
    UserInfoModel(
        userImage:
            'https://content-static.upwork.com/uploads/2014/10/01073429/profilephoto2.jpg',
        notificationCount: 1)
  ];

  List<RoomInfoModel> roomInfoData = [
    RoomInfoModel(
        title: 'Temperatura',
        isActive: true,
        iconData: CustomIcons.temperatire),
    RoomInfoModel(
        title: 'Cronometro',
        isActive: true,
        iconData: CustomIcons.lightbulb_outline),
    RoomInfoModel(
        title: 'Receitas',
        isActive: true,
        iconData: CustomIcons.music),
    RoomInfoModel(
        title: 'Config',
        isActive: false,
        iconData: CustomIcons.television),
    RoomInfoModel(
        title: 'Sobre',
        isActive: true,
        iconData: CustomIcons.router)
  ];

  void switchOffAll(RoomInfoModel roomInfoModel) {
    roomInfoModel.switchToggle();
    notifyListeners();
  }
}
