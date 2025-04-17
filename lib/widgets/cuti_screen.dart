import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leave_controller.dart';

class CutiScreen extends StatelessWidget {
  final leaveController = Get.put(LeaveController());

  @override
  Widget build(BuildContext context) {
    print("Build Cuti dijalankan");
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(leading: Icon(Icons.album), title: Text('Data Cuti')),
          Obx(
            () => Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Used Leave : ${leaveController.leaveData.value.usedLeave}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'On Progress Leave : ${leaveController.leaveData.value.onProgressLeave}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Remaining Leave : ${leaveController.leaveData.value.remainingLeave}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: leaveController.refreshLeave,
                child: Text('Refresh Cuti'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
