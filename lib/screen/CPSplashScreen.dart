import 'package:VESTNET3/main.dart';
import 'package:VESTNET3/screen/CPLoginScreen.dart';
import '../utils/CPImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CPSplashScreen extends StatefulWidget {
  @override
  CPSplashScreenState createState() => CPSplashScreenState();
}

class CPSplashScreenState extends State<CPSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 3));
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    CPLoginScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Color(0xFF064469));
    return Scaffold(
      backgroundColor: Color(0xFF064469),
      body: Container(
        child: Align(
          alignment: Alignment(-0.0, -0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(image: AssetImage(cp_logo_putih)),
              SizedBox(height: 8),
              Image(image: AssetImage(cp_tulisan_logo)),
            ],
          ),
        ),
      ),
    );
  }
}
