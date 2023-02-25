import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/features/index_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key, required this.title});

  final String title;

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  DateTime? _birthDate;
  TextEditingController? heightController = TextEditingController();
  TextEditingController? weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //Welcome User!
          Container(
            padding: const EdgeInsets.only(
                left: 20, right: 20, bottom: 10, top: 100),
            child: const Text(
              'Welcome Edz!',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          const SizedBox(height: 10),

          //Tell us more about yourself!
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: const Text(
              'Tell us more about yourself',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 26),
            ),
          ),
          const SizedBox(height: 20),

          //Birth Date Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DateTimeField(
                    mode: DateTimeFieldPickerMode.date,
                    decoration: const InputDecoration(
                        hintText: 'Birth Date', border: InputBorder.none),
                    onDateSelected: (DateTime value) {
                      setState(() {
                        _birthDate = value;
                      });
                    },
                    selectedDate: _birthDate,
                  )),
            ),
          ),
          const SizedBox(height: 10),

          //Weight Text Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Weight (Optional)'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          //Height Text Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  controller: heightController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Height (Optional)'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          const Spacer(),
          //All Set Button
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
                    'All Set!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const IndexScreen(title: 'Index'),
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
