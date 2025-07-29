import 'package:flutter/material.dart';
import 'package:health_app_ui/models/needed_category.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
              },
              borderRadius: BorderRadius.circular(190),
              child: Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.all(20),
              ),
            )
          ],
        );
      }),
    );
  }
}
