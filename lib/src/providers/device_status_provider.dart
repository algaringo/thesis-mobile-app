import 'package:flutter/material.dart';

class DeviceStatus with ChangeNotifier {
  String? _selectedDevice;

  String? get selectedDevice => _selectedDevice;

  void setSelectedDevice(String deviceName) {
    _selectedDevice = deviceName;
  }

  bool isDeviceConnected() {
    return _selectedDevice == null ? false : true;
  }
}
