import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism/widgets/futuristic_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: FuturisticWidget(
           vsync: this,
           child: Center(
             child: ClipRRect(
               borderRadius: BorderRadius.circular(30),
               child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 8 , sigmaY: 8),
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
                       onPressed: () {
                         Navigator.pushNamed(context, '/login');
                       },
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
             ),
           )),
    );
  }
}
