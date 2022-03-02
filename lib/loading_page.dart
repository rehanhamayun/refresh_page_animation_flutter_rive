import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:new_work/data.dart';
import 'package:rive/rive.dart';

class LoadingPage extends StatelessWidget {
  final _offsetToArmed = 220.0;
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFEFF8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Refresh"),
      ),
      body: CustomRefreshIndicator(
        child: DataPage(),
        onRefresh: () => Future.delayed(
          Duration(seconds: 3),
        ),
        offsetToArmed: _offsetToArmed,
        builder: (context, child, controller) => AnimatedBuilder(
          animation: controller,
          child: child,
          builder: (context, index) {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: _offsetToArmed * controller.value,
                  child: RiveAnimation.asset(
                    "assets/jump-man-animation-blending-example.riv",
                    fit: BoxFit.cover,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.0, _offsetToArmed * controller.value),
                  child: controller.isLoading ? const LoadingPage() : child,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
