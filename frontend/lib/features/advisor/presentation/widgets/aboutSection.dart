import 'package:flutter/material.dart';

import '../../domain/entities/advisor_entity.dart';
import 'aboutRow.dart';

class AboutSection extends StatelessWidget {
  final AdvisorEntity advisor;

  const AboutSection({
    super.key,
    required this.advisor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'PoppinsBold',
          ),
        ),
        const SizedBox(height: 8),
        AboutRow(
          labelOne: advisor.location,
          iconOne: Icons.location_on,
          iconTwo: Icons.work,
          labelTwo: advisor.speciality,
        ),
        const SizedBox(height: 16),
        AboutRow(
          labelOne: "Work with them ${advisor.workMode}",
          iconOne: Icons.computer,
          labelTwo: "${advisor.experience}+ Years experience",
        ),
        const SizedBox(height: 16),
        Text(
          advisor.advisorDescription,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
            fontFamily: 'PoppinsMedium',
          ),
        ),
      ],
    );
  }
}
