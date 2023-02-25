import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/features/index_screen.dart';
import 'package:intl/intl.dart';

class ViewHistoryScreen extends StatefulWidget {
  const ViewHistoryScreen({super.key, required this.title});

  final String title;

  @override
  State<ViewHistoryScreen> createState() => _ViewHistoryScreenState();
}

class _ViewHistoryScreenState extends State<ViewHistoryScreen> {
  String _currentDay = DateFormat('dddd').format(DateTime.now());
  String _dateNow = DateFormat('MMMM dd, yyyy hh:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //History!
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 60),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'History',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        'as of $_dateNow',
                        style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  //Status
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green,
                    ),
                  )
                ]),
          ),
          const SizedBox(height: 40),

          const Spacer(),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
