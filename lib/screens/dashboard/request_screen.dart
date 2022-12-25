import 'package:get/get.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/recent_request.dart';
import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/dashboard/controllers/request_controller.dart';

import 'components/header.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RequestController(Get.find()));
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: const RecentRequest(),
                  ),
                  // if (!Responsive.isMobile(context))
                  //   SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  // if (!Responsive.isMobile(context))
                  //   Expanded(
                  //     flex: 2,
                  //     child: UserDetailsWidget(),
                  //   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
