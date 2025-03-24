import 'package:flutter/material.dart';
import 'package:state_management_lanjutan/models/absensi_model.dart';
import 'package:state_management_lanjutan/models/employee_model.dart';
import 'package:state_management_lanjutan/models/leave_model.dart';
import 'package:state_management_lanjutan/repositories/home_repository.dart';

class HomeSingleWidget extends StatefulWidget {
  @override
  _HomeSingleWidgetState createState() => _HomeSingleWidgetState();
}

class _HomeSingleWidgetState extends State<HomeSingleWidget> {
  late List<EmployeeModel> employeeList = [];
  late AbsensiModel? absensiData;
  late LeaveModel leaveData;
  late HomeRepository homeRepository = HomeRepository();
  var itemCountEmployeeList = 0;

  @override
  void initState() {
    super.initState();
    employeeList = homeRepository.getDataEmployeeData();
    absensiData = homeRepository.getDataAbsensi();
    leaveData = homeRepository.getDataLeave();
    itemCountEmployeeList = employeeList.length;
  }

  @override
  Widget build(BuildContext context) {
    print("Build ulang dijalankan");
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page Example 1')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5, // Controls the shadow depth
              margin: EdgeInsets.all(
                10,
              ), // Controls the spacing around the card
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Employee Data'),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: itemCountEmployeeList,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Icon(Icons.list),
                          title: Text(employeeList[index].name),
                        );
                      },
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            itemCountEmployeeList++;
                            employeeList.add(
                              EmployeeModel(
                                name:
                                    "Employee " +
                                    itemCountEmployeeList.toString(),
                                alamat: "Bogor",
                              ),
                            );
                          });
                        },
                        child: Text('Add Employee'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              elevation: 5, // Controls the shadow depth
              margin: EdgeInsets.all(
                10,
              ), // Controls the spacing around the card
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Data Absensi'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Checkin : ' + absensiData!.checkin + ' ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Checkout : ' + absensiData!.checkout + ' ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            absensiData =
                                absensiData = AbsensiModel(
                                  checkin:
                                      "${(8 + (3 * (new DateTime.now().second % 2))).toString().padLeft(2, '0')}:00",
                                  checkout: "Missing",
                                );
                          });
                          // Add your action here
                        },
                        child: Text('Update Data'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              elevation: 5, // Controls the shadow depth
              margin: EdgeInsets.all(
                10,
              ), // Controls the spacing around the card
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Data Cuti'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Used Leave : ' + leaveData!.usedLeave + ' ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'On Progress Leave : ' + leaveData!.onProgressLeave + ' ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Remaining Leave :' + leaveData!.remainingLeave + ' ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            leaveData = LeaveModel(
                              usedLeave:
                                  (1 + (new DateTime.now().second % 5))
                                      .toString(),
                              onProgressLeave:
                                  (1 + (new DateTime.now().second % 5))
                                      .toString(),
                              remainingLeave:
                                  (1 + (new DateTime.now().second % 5))
                                      .toString(),
                            );
                          });
                        },
                        child: Text('Refresh Cuti'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
