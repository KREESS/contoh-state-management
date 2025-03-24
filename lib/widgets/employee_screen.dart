import 'package:flutter/material.dart';
import 'package:state_management_lanjutan/models/employee_model.dart';
import 'package:state_management_lanjutan/repositories/home_repository.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  late List<EmployeeModel> employeeList = [];
  late HomeRepository homeRepository = HomeRepository();
  var itemCountEmployeeList = 0;

  @override
  void initState() {
    super.initState();
    employeeList = homeRepository.getDataEmployeeData();
    itemCountEmployeeList = employeeList.length;
  }

  @override
  Widget build(BuildContext context) {
    print("Build Employee dijalankan");
    return Card(
      elevation: 5, // Controls the shadow depth
      margin: EdgeInsets.all(10), // Controls the spacing around the card
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(leading: Icon(Icons.album), title: Text('Employee Data')),
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
                        name: "Employee " + itemCountEmployeeList.toString(),
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
    );
  }
}
