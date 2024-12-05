import 'actionButton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/entities/advisor_entity.dart';

class AboutActionSection extends StatelessWidget {
  final AdvisorEntity advisor;

  const AboutActionSection({
    super.key,
    required this.advisor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Actions",
          style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ActionButton(
              label: "Call",
              labelIcon: Icons.phone_enabled_outlined,
              onClick: () async {
                Uri dialNumber = Uri(scheme: 'tel', path: advisor.phoneNum);
                await launchUrl(dialNumber);
              },
            ),
            const SizedBox(width: 16),
            const ActionButton(
              label: "Send message",
              labelIcon: Icons.message,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const SizedBox(
          width: 145,
          child: ActionButton(
            label: "Availability",
            labelIcon: Icons.calendar_month,
          ),
        ),
      ],
    );
  }
}
