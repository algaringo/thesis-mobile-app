import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/features/index_screen.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/src/shared/line_chart.dart';

class HeartRateIndexScreen extends StatefulWidget {
  const HeartRateIndexScreen({super.key, required this.title});

  final String title;

  @override
  State<HeartRateIndexScreen> createState() => _HeartRateIndexScreenState();
}

class _HeartRateIndexScreenState extends State<HeartRateIndexScreen> {
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
                        'Heart Rate',
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
          const SizedBox(height: 20),
          //Chart
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 60),
            child: const LineChartWidget(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 2,
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    'Return to Dashboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const IndexScreen(title: 'Dashboard'),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
