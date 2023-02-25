import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.title});

  final String title;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  StreamSubscription? _scanSubscription;
  List<ScanResult> _scanResults = [];

  @override
  void initState() {
    super.initState();

    // Start scanning for Bluetooth devices
    _scanSubscription = FlutterBlue.instance.scan().listen((scanResult) {
      setState(() {
        _scanResults.add(scanResult);
      });
    });
  }

  @override
  void dispose() {
    // Stop scanning for Bluetooth devices when this screen is disposed
    _scanSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Devices'),
      ),
      body: ListView.builder(
        itemCount: _scanResults.length,
        itemBuilder: (context, index) {
          final device = _scanResults[index].device;

          return ListTile(
            title: Text(device.name.isEmpty ? 'Unknown Device' : device.name),
            subtitle: Text(device.id.toString()),
            onTap: () {
              // Navigate to the details screen when a device is tapped
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BluetoothDeviceDetailsScreen(device),
              ));
            },
          );
        },
      ),
    );
  }
}

class BluetoothDeviceDetailsScreen extends StatefulWidget {
  const BluetoothDeviceDetailsScreen(this.device, {Key? key}) : super(key: key);

  final BluetoothDevice device;

  @override
  _BluetoothDeviceDetailsScreenState createState() =>
      _BluetoothDeviceDetailsScreenState();
}

class _BluetoothDeviceDetailsScreenState
    extends State<BluetoothDeviceDetailsScreen> {
  late BluetoothDevice _device;
  List<BluetoothService>? _services;

  @override
  void initState() {
    super.initState();
    _device = widget.device;

    // Connect to the Bluetooth device
    _device.connect().then((value) {
      // Discover the services and characteristics of the Bluetooth device
      _device.discoverServices().then((services) {
        setState(() {
          _services = services;
        });
      });
    });
  }

  @override
  void dispose() {
    // Disconnect from the Bluetooth device when this screen is disposed
    _device.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_device.name.isEmpty ? 'Unknown Device' : _device.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Device ID'),
              subtitle: Text(_device.id.toString()),
            ),
            const Divider(),
            if (_services != null)
              for (var service in _services!)
                Column(
                  children: [
                    ListTile(
                      title: const Text('Service'),
                      subtitle: Text(service.uuid.toString()),
                    ),
                    if (service.characteristics != null)
                      for (var characteristic in service.characteristics!)
                        ListTile(
                          title: const Text('Characteristic'),
                          subtitle: Text(characteristic.uuid.toString()),
                        ),
                    const Divider(),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
