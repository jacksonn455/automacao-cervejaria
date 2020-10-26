import 'package:flutter/foundation.dart';
import 'package:velha_guarda/Model/homeinfomodel.dart';
import 'activetabmodel.dart';

// Pagina da temperatura
class HomeInfoData extends ChangeNotifier {
  List<HomeInfoModel> infoData = [
    HomeInfoModel(
        title: 'Monitor de temperatura',
        isFanOn: false,
        setTemp: 75,
        fanSpeed: 0,
        knobReading: 0.37
    ),
  ];

  ActiveTabIndex tabIndex;

  void setTabIndex(int index){
    tabIndex.setActiveTabIndex(index);
    notifyListeners();
  }

  int get tabIndexCount{
    return tabIndex.activeIndex;
  }


  void changeFanSpeed(HomeInfoModel infoModel, int speed) {
    infoModel.setFanSpeed(speed);
    notifyListeners();
  }

  HomeInfoModel infoModel(int index) {
    return infoData[index];
  }

  void changeTemp(HomeInfoModel infoModel, int changeTemp) {
    infoModel.setTemp = changeTemp;
    notifyListeners();
  }

  int get roomCount {
    return infoData.length;
  }

  void switchFan(HomeInfoModel infoModel){
    infoModel.switchFan();
    notifyListeners();
  }

  void setKnobPreCent(HomeInfoModel infoModel, double reading){
    infoModel.setKnobReading(reading);
    notifyListeners();

  }

  double getKnobReading(int index){
    return infoData[index].knobReading;
  }




}
