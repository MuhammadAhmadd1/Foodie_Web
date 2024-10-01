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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //app bar colors
                Colors.purpleAccent,
                Colors.cyanAccent,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: const Text(
          "Admin Web Portal",
          style: TextStyle(
            color: Colors.white, //appbar text color
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "$currentTime \n$currentDate", //displaying current date and time
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            //user activate and block accounts ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //activate
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    padding: const EdgeInsets.all(20),
                  ),
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Activate User Accounts',
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 2, color: Colors.white),
                  ),
                ),
                //block
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent[400],
                    padding: const EdgeInsets.all(20),
                  ),
                  icon: const Icon(
                    Icons.block_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Block User Accounts',
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 2, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            //Sellers activate and block accounts ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //activate
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    padding: const EdgeInsets.all(20),
                  ),
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Activate Sellers',
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 2, color: Colors.white),
                  ),
                ),
                //block
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent[400],
                    padding: const EdgeInsets.all(20),
                  ),
                  icon: const Icon(
                    Icons.block_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Block Sellers',
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 2, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            //Riders activate and block accounts ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //activate
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    padding: const EdgeInsets.all(20),
                  ),
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Activate Riders',
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 2, color: Colors.white),
                  ),
                ),
                //block
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent[400],
                    padding: const EdgeInsets.all(20),
                  ),
                  icon: const Icon(
                    Icons.block_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Block Riders',
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 2, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.cyanAccent[400],
              ),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: const Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 20, letterSpacing: 2, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
