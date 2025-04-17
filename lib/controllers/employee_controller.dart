import 'dart:math';
import 'package:get/get.dart';
import '../models/employee_model.dart';
import '../repositories/home_repository.dart';

class EmployeeController extends GetxController {
  var employeeList = <EmployeeModel>[].obs;
  final homeRepository = HomeRepository();

  final List<String> dummyNames = [
    "Andi",
    "Budi",
    "Citra",
    "Dewi",
    "Eka",
    "Fajar",
    "Gita",
  ];
  final List<String> dummyCities = [
    "Jakarta",
    "Bandung",
    "Surabaya",
    "Bogor",
    "Depok",
    "Bekasi",
  ];

  @override
  void onInit() {
    employeeList.value = homeRepository.getDataEmployeeData();
    super.onInit();
  }

  void addEmployee() {
    final random = Random();
    final name = dummyNames[random.nextInt(dummyNames.length)];
    final city = dummyCities[random.nextInt(dummyCities.length)];

    employeeList.add(
      EmployeeModel(name: "$name ${employeeList.length + 1}", alamat: city),
    );
  }
}
