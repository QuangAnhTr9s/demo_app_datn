import 'dart:async';

import 'package:flutter/material.dart';

class HomePageBloc{
  late TabController _tabController;
  double _temperature = 0;
  double _humidity = 0;
  double _gas = 0;

  bool _isClickedLightButton1 = false;
  bool _isClickedLightButton2 = false;
  bool _isClickedLightButton3 = false;
  bool _isClickedFanButton = false;

  final StreamController<bool> _light1StreamController = StreamController<bool>.broadcast();
  final StreamController<bool> _light2StreamController = StreamController<bool>.broadcast();
  final StreamController<bool> _light3StreamController = StreamController<bool>.broadcast();
  final StreamController<bool> _fanStreamController = StreamController<bool>.broadcast();

  Stream<bool> get light1Stream => _light1StreamController.stream;
  Stream<bool> get light2Stream => _light2StreamController.stream;
  Stream<bool> get light3Stream => _light3StreamController.stream;
  Stream<bool> get fanStream => _fanStreamController.stream;

  StreamSink get _light1Sink => _light1StreamController.sink;
  StreamSink get _light2Sink => _light2StreamController.sink;
  StreamSink get _light3Sink => _light3StreamController.sink;
  StreamSink get _fanSink => _fanStreamController.sink;


  void handleClickLightButton1(){
    _isClickedLightButton1 = !_isClickedLightButton1;
    _light1Sink.add(_isClickedLightButton1);
  }
  void handleClickfanButton(){
    _isClickedFanButton = !_isClickedFanButton;
    _fanSink.add(_isClickedFanButton);
  }
  void handleClickLightButton2(){
    _isClickedLightButton2 = !_isClickedLightButton2;
    _light2Sink.add(_isClickedLightButton2);
  }
  void handleClickLightButton3(){
    _isClickedLightButton3 = !_isClickedLightButton3;
    _light3Sink.add(_isClickedLightButton3);
  }

  TabController get tabController => _tabController;

  set tabController(TabController value) {
    _tabController = value;
  }

  void dispose(){
    _tabController.dispose();
    _light1StreamController.close();
    _light2StreamController.close();
    _light3StreamController.close();
    _fanStreamController.close();
  }

  double get gas => _gas;

  set gas(double value) {
    _gas = value;
  }

  double get humidity => _humidity;

  set fan(double value) {
    _humidity = value;
  }

  double get temperature => _temperature;

  set temperature(double value) {
    _temperature = value;
  }
}