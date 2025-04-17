import 'package:get/get.dart';
import '../models/absensi_model.dart';
import '../repositories/home_repository.dart';

class AbsensiController extends GetxController {
  final HomeRepository homeRepository = HomeRepository();

  var absensiData = AbsensiModel(checkin: '', checkout: '').obs;

  @override
  void onInit() {
    absensiData.value = homeRepository.getDataAbsensi();
    super.onInit();
  }

  void updateAbsensi() {
    absensiData.value = AbsensiModel(
      checkin:
          "${(8 + (3 * (DateTime.now().second % 2))).toString().padLeft(2, '0')}:00",
      checkout: "Missing",
    );
  }
}
