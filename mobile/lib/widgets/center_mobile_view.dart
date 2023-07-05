import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CenterMobileViewWidget extends StatelessWidget {
  final Widget? child;
  final Color backgroundColor;
  const CenterMobileViewWidget(
      {super.key, required this.child, this.backgroundColor = Colors.black12});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: responsiveValue(screenSize, 8, 70, null),
                vertical: responsiveValue(screenSize, 2, 40, null)),
            alignment: Alignment.topCenter,
            color: backgroundColor,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 375,
                  maxHeight: 800,
                ), //max width set to mobile width
                child: child,
              ),
            )),
      ).animate().fadeIn(),
    );
  }
}

double responsiveValue(
    Size screenSize, double mobile, double desktop, double? tablet) {
  if (screenSize.width >= 1200) {
    return desktop;
  } else if (screenSize.width >= 768) {
    return tablet ?? desktop;
  } else {
    return mobile;
  }
}


//mobile 375
//tablet 768
//desktop 1200

//height 702