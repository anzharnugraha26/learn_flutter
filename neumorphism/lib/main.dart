import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      home: MerpereumHome(),
    );
  }
}

class MerpereumHome extends StatefulWidget {
  const MerpereumHome({super.key});

  @override
  State<MerpereumHome> createState() => _MerpereumHomeState();
}

class _MerpereumHomeState extends State<MerpereumHome>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
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
          ),
        ),
        vsync: this,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF7FBCD2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Merpereum',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Futuristic Wallet UI',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: Text('Connect Wallet'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

          ),
        ),
      ),
    );
  }
}