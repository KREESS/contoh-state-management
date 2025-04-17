import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/absensi_controller.dart';

class AbsensiScreen extends StatelessWidget {
  final AbsensiController controller = Get.put(AbsensiController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Data Absensi'),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Checkin: ${controller.absensiData.value.checkin}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Checkout: ${controller.absensiData.value.checkout}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: controller.updateAbsensi,
                child: Text('Update Absensi'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
