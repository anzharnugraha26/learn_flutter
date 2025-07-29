import 'package:flutter/material.dart';
import 'package:health_app_ui/utils/colors.dart';
import 'package:iconsax/iconsax.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Container(
        width: double.maxFinite,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg"))),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'dr. Ruben Dorwart',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        'Dental Specialst',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: profileCardBgColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                height: 35,
                width: 390,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Iconsax.calendar_1 , color: Colors.white,),
                    Text("Today" , style: TextStyle(fontWeight: FontWeight.w600 , color: Colors.white),),
                    SizedBox(width: 10,),
                    Icon(Iconsax.clock , color: Colors.white,),
                    Text("14:30 - 15:30 AM" , style: TextStyle(fontWeight: FontWeight.w600 , color: Colors.white),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
