import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:shop_application/common/utils/custom_snackbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: DelayedWidget(
              delayDuration: Duration(milliseconds: 1000), // Not required
              animationDuration: Duration(seconds: 2), // Not required
              animation: DelayedAnimations.SLIDE_FROM_LEFT, // Not required

              child: Image.asset(
                "assets/images/besenior_logo.png",
              ),
            ),
          ),
          Text(
            "به اینترنت متصل هستید",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }

  Future<void> gotoHome() {
    return Future.delayed(Duration(seconds: 3), () {
      CustomSnackbar.showSnack(context, "وارد شدید", Colors.green);
    });
  }
}
