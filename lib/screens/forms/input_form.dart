import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/forms/controllers/detail_controller.dart';
import 'package:smart_admin_dashboard/services/data/models/diet.model.dart';
import 'package:smart_admin_dashboard/services/data/models/exercise.model.dart';
import 'package:smart_admin_dashboard/services/data/models/user.model.dart';

class FormMaterial extends StatelessWidget {
  final UserModel user;

  const FormMaterial({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResultController(Get.find(), user));
    return Scaffold(
      appBar: new AppBar(
        leading: BackButton(
          onPressed: () {
            controller.dispose();
            Get.back();
          },
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Card(
              color: bgColor,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(32, 32, 64, 32),
              child: SizedBox(
                height: Get.height * .9,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Column(
                      children: [
                        Center(
                          child: Text("Exercise Logs"),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Obx(
                          () => Expanded(
                            child: controller.exerciseLogs.isNotEmpty
                                ? GroupedListView<ExerciseLog, String>(
                                    elements: controller.exerciseLogs,
                                    groupBy: (element) =>
                                        DateFormat('dd-MM-yyyy').format(
                                            element.time ?? DateTime.now()),
                                    groupComparator: (value1, value2) =>
                                        value2.compareTo(value1),
                                    itemComparator: (item1, item2) =>
                                        (item1.time ?? DateTime.now())
                                            .compareTo(
                                                (item2.time ?? DateTime.now())),
                                    order: GroupedListOrder.DESC,
                                    useStickyGroupSeparators: true,
                                    groupSeparatorBuilder: (String value) =>
                                        Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    itemBuilder: (c, log) {
                                      return Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 6.0),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 6.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(log.exerciseName ?? '',
                                                      style: const TextStyle(
                                                          fontSize: 18)),
                                                  Text(DateFormat('hh:mm a')
                                                      .format(
                                                          log.time?.toLocal() ??
                                                              DateTime.now())),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Text("${log.reps ?? 0} reps",
                                                  style: const TextStyle(
                                                      fontSize: 12)),
                                              Text(
                                                  "${log.totalCaloriesBurn ?? 0} kCal",
                                                  style: const TextStyle(
                                                      fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox.shrink(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              color: bgColor,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(32, 32, 64, 32),
              child: SizedBox(
                height: Get.height * .9,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text("Diet Logs"),
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          Obx(
                            () => Expanded(
                              child: controller.foodLogs.isNotEmpty
                                  ? GroupedListView<FoodLog, String>(
                                      elements: controller.foodLogs,
                                      groupBy: (element) =>
                                          DateFormat('dd-MM-yyyy').format(
                                              element.time ?? DateTime.now()),
                                      groupComparator: (value1, value2) =>
                                          value2.compareTo(value1),
                                      itemComparator: (item1, item2) => (item1
                                                  .time ??
                                              DateTime.now())
                                          .compareTo(
                                              (item2.time ?? DateTime.now())),
                                      order: GroupedListOrder.DESC,
                                      useStickyGroupSeparators: true,
                                      groupSeparatorBuilder: (String value) =>
                                          Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      itemBuilder: (c, log) {
                                        return Card(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 6.0),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 6.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(log.foodName ?? '',
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                    Text(DateFormat('hh:mm a')
                                                        .format(log.time
                                                                ?.toLocal() ??
                                                            DateTime.now())),
                                                  ],
                                                ),
                                                const SizedBox(height: 12),
                                                Text(
                                                    "${log.totalCaloriesIntake ?? 0} kCal",
                                                    style: const TextStyle(
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          )
                        ],
                      ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
