import 'package:flutter/foundation.dart';
import 'package:velha_guarda/Model/homedatamodel.dart';
import 'package:velha_guarda/icons/my_flutter_app_icons.dart';



class HomePageData extends ChangeNotifier {

  List<RoomInfoModel> roomInfoData = [
    RoomInfoModel(
        title: 'Temperatura',
        isActive: true,
        iconData: CustomIcons.ac_unit),
    RoomInfoModel(
        title: 'Cronometro',
        isActive: true,
        iconData: CustomIcons.access_time),
    RoomInfoModel(
        title: 'Receitas',
        isActive: true,
        iconData: CustomIcons.book),
    RoomInfoModel(
        title: 'Config',
        isActive: false,
        iconData: CustomIcons.settings),
    RoomInfoModel(
        title: 'Sobre',
        isActive: true,
        iconData: CustomIcons.location_on),
  ];

  void switchOffAll(RoomInfoModel roomInfoModel) {
    roomInfoModel.switchToggle();
    notifyListeners();
  }
}
