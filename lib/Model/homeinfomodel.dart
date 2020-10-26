

class HomeInfoModel {
  String title;
  int setTemp;
  int fanSpeed;
  bool isFanOn;
  double knobReading;

  HomeInfoModel({
    this.title="room",
    this.isFanOn = false,
    this.setTemp =0,
    this.fanSpeed=2,
    this.knobReading,
  });

  void switchFan() {
    isFanOn = !isFanOn;
  }

  void setFanSpeed(int speed){
    fanSpeed = speed;
  }

  void setKnobReading(double reading){
    knobReading = reading;
  }


}
