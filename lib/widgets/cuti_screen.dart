import 'package:flutter/material.dart';
import 'package:state_management_lanjutan/models/leave_model.dart';
import 'package:state_management_lanjutan/repositories/home_repository.dart';

class CutiScreen extends StatefulWidget {
  const CutiScreen({Key? key}) : super(key: key);

  @override
  _CutiScreenState createState() => _CutiScreenState();
}

class _CutiScreenState extends State<CutiScreen> {
  late LeaveModel leaveData;
  late HomeRepository homeRepository = HomeRepository();

  @override
  void initState() {
    super.initState();
    leaveData = homeRepository.getDataLeave();
  }

  @override
  Widget build(BuildContext context) {
    print("Build Cuti dijalankan");
    return Card(
      elevation: 5, // Controls the shadow depth
      margin: EdgeInsets.all(10), // Controls the spacing around the card
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(leading: Icon(Icons.album), title: Text('Data Cuti')),
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
                          (1 + (new DateTime.now().second % 5)).toString(),
                      onProgressLeave:
                          (1 + (new DateTime.now().second % 5)).toString(),
                      remainingLeave:
                          (1 + (new DateTime.now().second % 5)).toString(),
                    );
                  });
                },
                child: Text('Refresh Cuti'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
