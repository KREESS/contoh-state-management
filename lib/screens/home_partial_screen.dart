import 'package:flutter/material.dart';
import 'package:state_management_lanjutan/widgets/absensi_screen.dart';
import 'package:state_management_lanjutan/widgets/cuti_screen.dart';
import 'package:state_management_lanjutan/widgets/employee_screen.dart';

class HomePartialScreen extends StatelessWidget {
  const HomePartialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build ulang dijalankan");
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page Example 1')),
      body: SingleChildScrollView(
        child: Column(
          children: [EmployeeScreen(), AbsensiScreen(), CutiScreen()],
        ),
      ),
    );
  }
}
