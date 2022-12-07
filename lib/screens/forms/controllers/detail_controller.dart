import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_admin_dashboard/services/data/models/diet.model.dart';
import 'package:smart_admin_dashboard/services/data/models/exercise.model.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';
import 'package:smart_admin_dashboard/services/data/repositories/log_repository.dart';

class ResultController extends GetxController {
  final LogRepository logService;
  final UserModel user;

  ResultController(this.logService, this.user);

  RxList<FoodLog> foodLogs = <FoodLog>[].obs;
  RxList<ExerciseLog> exerciseLogs = <ExerciseLog>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getLogs();
    super.onInit();
  }

  void getLogs() async {
    try {
      EasyLoading.show();
      List<Future> requests = [
        logService.getDietLog(user.email!),
        logService.getExerciseLog(user.email!)
      ];
      final res = await Future.wait(requests);
      foodLogs.assignAll(res[0] as List<FoodLog>);
      exerciseLogs.assignAll(res[1] as List<ExerciseLog>);
    } on Exception catch (e) {
      Get.snackbar('Get Result Failed', e.toString());
    } finally {
      EasyLoading.dismiss();
    }

  }
}
