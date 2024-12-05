import 'package:cherrystreet/constants/colors.dart';
import 'package:cherrystreet/features/advisor/domain/entities/advisor_entity.dart';
import 'package:flutter/material.dart';

class AboutTop extends StatelessWidget {
  final AdvisorEntity advisor;

  const AboutTop({
    super.key,
    required this.advisor,
  });

  @override
  Widget build(BuildContext context) {
    int specialistJoinDate = advisor.joinDate;
    String specialistName = advisor.advisorName;
    String speciality = advisor.speciality;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "My advisor",
          style: TextStyle(
            fontSize: 25,
            color: AppColors.white,
            fontFamily: 'PoppinsBold',
          ),
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            advisor.img,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hi, I'm $specialistName, your\n$speciality",
              style: const TextStyle(
                fontSize: 17,
                fontFamily: 'PoppinsBold',
              ),
            ),
            const CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.primaryClr,
            ),
          ],
        ),
        const SizedBox(height: 9),
        Text(
          "Your specialist since $specialistJoinDate",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontFamily: 'PoppinsMedium',
          ),
        ),
      ],
    );
  }
}
