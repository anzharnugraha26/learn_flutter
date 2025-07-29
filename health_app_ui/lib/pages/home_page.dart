import 'package:flutter/material.dart';
import 'package:health_app_ui/widgets/doctor_profile.dart';
import 'package:health_app_ui/widgets/health_needs.dart';
import 'package:health_app_ui/widgets/nearby_doctor.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Jane",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'How are you feeling today?',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black26,
                  fontWeight: FontWeight.w800),
            )
          ],
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black26),
            ),
            child: const Icon(
              Iconsax.notification,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black26),
            ),
            child: const Icon(
              Iconsax.search_normal,
              size: 25,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: const [
          DoctorProfile(),
          SizedBox(
            height: 18,
          ),
          Text(
            'Health Needs',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 18,
          ),
          HealthNeeds(),
          SizedBox(
            height: 18,
          ),
          Text(
            'Nearby Doctor',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 18,
          ),
          NearbyDoctor()
        ],
      ),
    );
  }
}
