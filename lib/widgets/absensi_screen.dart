import 'package:flutter/material.dart';
import 'package:state_management_lanjutan/models/absensi_model.dart';
import 'package:state_management_lanjutan/repositories/home_repository.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({Key? key}) : super(key: key);

  @override
  _AbsensiScreenState createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  late AbsensiModel? absensiData;
  late HomeRepository homeRepository = HomeRepository();

  @override
  void initState() {
    super.initState();
    absensiData = homeRepository.getDataAbsensi();
  }

  @override
  Widget build(BuildContext context) {
    print("Build Absensi dijalankan");
    return Card(
      elevation: 5, // Controls the shadow depth
      margin: EdgeInsets.all(10), // Controls the spacing around the card
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(leading: Icon(Icons.album), title: Text('Data Absensi')),
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
    );
  }
}
