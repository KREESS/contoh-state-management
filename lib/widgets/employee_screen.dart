import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';

class EmployeeScreen extends StatelessWidget {
  final controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(leading: Icon(Icons.album), title: Text('Employee Data')),
          Container(
            height: 150,
            child: Obx(
              () => ListView.builder(
                itemCount: controller.employeeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.list),
                    title: Text(controller.employeeList[index].name),
                  );
                },
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: controller.addEmployee,
                child: Text('Add Employee'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
