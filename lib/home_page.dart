import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_now/time_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(onPressed: () {
              showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime.now()).then((value) {
                if(value != null) {
                  final currentYear = DateTime.now().year;
                  final age = currentYear - value.year;
                  ScaffoldMessenger.of(context).clearMaterialBanners();
                  ScaffoldMessenger.of(context)
                      .showMaterialBanner(MaterialBanner(backgroundColor: Colors.red,content: Text(age.toString()), actions: [
                    Text('')
                  ]));
                }
              });

            }, child: Text("Choose your date")),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () async {
              final selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              print(selectedTime?.hour);
              print(selectedTime?.minute);
            }, child: Text("Choose time")),
            const SizedBox(height: 30),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(onDateTimeChanged: (date) {
                print(date);
              }),
            ),
            SizedBox(
              height: 200,
              child: CupertinoTimerPicker(onTimerDurationChanged: (time) {
                print(time);
              }),
            ),
            // ElevatedButton(onPressed: () {
            //
            // }, child: Text("Choose time"))
            const SizedBox(height: 30),
            TimeText()
          ],
        ),
      ),
    );
  }
}
