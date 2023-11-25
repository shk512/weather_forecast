import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/utils/app_utils.dart';

class Background extends StatelessWidget {
  final String weather;
  final Widget child;
  const Background({
    super.key,
    required this.weather,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppUtils.getImagePathByWeatherType(weather),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BlurryContainer(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          borderRadius: BorderRadius.circular(0),
          padding: const EdgeInsets.all(0),
          blur: 4,
          child: child,
        ),
      ],
    );
  }
}
