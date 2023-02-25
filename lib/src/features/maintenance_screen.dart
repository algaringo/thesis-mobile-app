import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Under Maintenance',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 26, color: Colors.white),
          ),
        ));
  }
}
