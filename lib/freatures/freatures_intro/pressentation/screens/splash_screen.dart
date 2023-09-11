import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_application/common/utils/custom_snackbar.dart';
import 'package:shop_application/freatures/freatures_intro/pressentation/bloc/spash_cubit/splash_cubit.dart';

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
    // gotoHome();
    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
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
          BlocConsumer<SplashCubit, SplashState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state.connectionStatus is ConnectionOn) {
                gotoHome();
              }
              if (state.connectionStatus is ConnectionOff) {}
              if (state.connectionStatus is ConnectionInitial) {}
            },
            builder: (context, state) {
              if (state.connectionStatus is ConnectionInitial ||
                  state.connectionStatus is ConnectionOn) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: LoadingAnimationWidget.prograssiveDots(
                      color: Colors.red, size: 50),
                );
              }

              if (state.connectionStatus is ConnectionOff) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "به اینترنت متصل نیستید",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontFamily: "vazir"),
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<SplashCubit>(context)
                              .checkConnectionEvent();
                        },
                        icon: const Icon(
                          Icons.autorenew,
                          color: Colors.red,
                        )),
                  ],
                );
              }
              return Container();
            },
          ),
          const SizedBox(
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
