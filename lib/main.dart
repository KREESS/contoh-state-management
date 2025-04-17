import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:state_management_lanjutan/screens/home_partial_screen.dart';
import 'package:state_management_lanjutan/screens/home_screen.dart';
import '../controllers/absensi_controller.dart';
import '../controllers/employee_controller.dart';
import '../controllers/leave_controller.dart';

void main() {
  Get.put(AbsensiController());
  Get.put(LeaveController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePartialScreen(),
    );
  }
}
