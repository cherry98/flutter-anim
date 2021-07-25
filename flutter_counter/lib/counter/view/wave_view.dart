import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [
            const Color.fromRGBO(72, 74, 126, 1),
            const Color.fromRGBO(125, 170, 206, 1),
            const Color.fromRGBO(184, 189, 245, 0.7)
          ],
          [
            const Color.fromRGBO(72, 74, 126, 1),
            const Color.fromRGBO(125, 170, 206, 1),
            const Color.fromRGBO(172, 182, 219, 0.7)
          ],
          [
            const Color.fromRGBO(72, 73, 126, 1),
            const Color.fromRGBO(125, 170, 206, 1),
            const Color.fromRGBO(190, 238, 246, 0.7)
          ],
        ],
        durations: [19440, 10800, 6000],
        heightPercentages: [0.03, 0.01, 0.02],
        gradientBegin: Alignment.bottomCenter,
        gradientEnd: Alignment.topCenter,
      ),
      size: const Size(double.infinity, double.infinity),
      waveAmplitude: 25,
      backgroundColor: Colors.blue[50],
    );
  }
}
