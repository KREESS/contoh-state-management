import 'package:state_management_lanjutan/models/absensi_model.dart';
import 'package:state_management_lanjutan/models/employee_model.dart';
import 'package:state_management_lanjutan/models/leave_model.dart';

class HomeRepository {
  List<EmployeeModel> getDataEmployeeData() {
    List<EmployeeModel> results = [];
    results.add(EmployeeModel(name: "Mr Ahmad Dani", alamat: "Jakarta Pusat"));
    results.add(EmployeeModel(name: "Mr Once", alamat: "Jakarta Selatam"));
    return results;
  }

  LeaveModel getDataLeave() {
    LeaveModel leave = LeaveModel(
      usedLeave: "2",
      onProgressLeave: "2",
      remainingLeave: "8",
    );
    return leave;
  }

  AbsensiModel getDataAbsensi() {
    AbsensiModel absensi = AbsensiModel(checkin: "08:00", checkout: "");
    return absensi;
  }
}
