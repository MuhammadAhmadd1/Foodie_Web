import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentTime = ""; //variable to store time
  String currentDate = ""; //variable to store date

  String formatCurrentTime(DateTime time) {
    //declaring the date and time format
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  void getCurrentTime() {
    final DateTime timeNow = DateTime.now();
    final liveTime =
        formatCurrentTime(timeNow); //storing time init to get aa:mm:ss a
    final liveDate =
        formatCurrentDate(timeNow); //storing date to get dd MMMM, yyyy

    if (mounted) {
      setState(
        () {
          //storing the time and date in a specific format in a string type var
          //widget we'll use to display only accepts string type var
          currentTime = liveTime;
          currentDate = liveDate;
        },
      );
    }
  }

  @override
  void initState() {
    //exec when the code compiles
    super.initState();
    //time
    currentTime = formatCurrentTime(DateTime.now());
    //date
    currentDate = formatCurrentDate(DateTime.now());

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        getCurrentTime();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Portal"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "$currentTime \n$currentDate",
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) 
          ],
        ),
      ),
    );
  }
}
