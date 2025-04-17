import 'package:get/get.dart';
import '../models/leave_model.dart';
import '../repositories/home_repository.dart';

class LeaveController extends GetxController {
  final homeRepository = HomeRepository();

  // Observable LeaveModel
  var leaveData =
      LeaveModel(usedLeave: '0', onProgressLeave: '0', remainingLeave: '0').obs;

  @override
  void onInit() {
    super.onInit();
    leaveData.value = homeRepository.getDataLeave();
  }

  void refreshLeave() {
    leaveData.value = LeaveModel(
      usedLeave: (1 + (DateTime.now().second % 5)).toString(),
      onProgressLeave: (1 + (DateTime.now().second % 5)).toString(),
      remainingLeave: (1 + (DateTime.now().second % 5)).toString(),
    );
  }
}
