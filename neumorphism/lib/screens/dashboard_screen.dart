import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/category_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Anna!', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('How are you feeling today?', style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),

            // Progress Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF1FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your progress', style: GoogleFonts.poppins(color: Colors.grey)),
                      const SizedBox(height: 8),
                      Text('13 Feb', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('47%', style: GoogleFonts.poppins(fontSize: 20, color: Colors.deepPurple)),
                    ],
                  ),
                  Image.asset('assets/images/progress.png', height: 60), // ← tambahkan ilustrasi circle/graph di sini
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Popular Categories
            Text('Popular categories', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: const [
                CategoryCard(title: 'Reduce stress', iconPath: 'assets/icons/stress.png'),
                CategoryCard(title: 'Brain power', iconPath: 'assets/icons/brain.png'),
                CategoryCard(title: 'Focus on yourself', iconPath: 'assets/icons/focus.png'),
                CategoryCard(title: 'Mental health', iconPath: 'assets/icons/mental.png'),
              ],
            ),

            const SizedBox(height: 20),
            Text('Recently played', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('🎧 1 meditation', style: GoogleFonts.poppins(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
