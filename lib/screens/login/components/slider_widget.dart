import 'dart:async';

import 'package:smart_admin_dashboard/models/slider_model.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double? screenWidth;
  Timer? timer;
  int currentIndex = 0;
  int? totalIndex;
  final controller = PageController();
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(Duration(seconds: 5), (time) {
        if (currentIndex < totalIndex!) {
          controller.animateTo(currentIndex * (screenWidth!),
              duration: Duration(milliseconds: 1000), curve: Curves.ease);
          currentIndex++;
        } else {
          currentIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width / 2;
    totalIndex = slides.length;
    return Container(
      child: Image.asset('assets/images/background.jpg', fit: BoxFit.fitHeight,),
    );
  }
}
