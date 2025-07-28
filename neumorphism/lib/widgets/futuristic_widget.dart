import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class FuturisticWidget extends StatelessWidget {
  final Widget child;
  final TickerProvider vsync;
  const FuturisticWidget({super.key, required this.child, required this.vsync});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
        baseColor: Colors.white.withOpacity(0.2),
        spawnOpacity: 0.3,
        opacityChangeRate: 0.25,
        minOpacity: 0.1,
        maxOpacity: 0.4,
        spawnMinSpeed: 10.0,
        spawnMaxSpeed: 30.0,
        spawnMinRadius: 20.0,
        spawnMaxRadius: 40.0,
        particleCount: 30,
      )),
      vsync: vsync,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF7FBCD2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft)),
        child: child,
      ),
    );
  }
}
