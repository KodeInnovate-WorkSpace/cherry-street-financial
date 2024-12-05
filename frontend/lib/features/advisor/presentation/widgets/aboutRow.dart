import 'package:flutter/material.dart';

class AboutRow extends StatelessWidget {
  final String labelOne;
  final IconData iconOne;
  final String? labelTwo;
  final IconData? iconTwo;

  const AboutRow({
    super.key,
    required this.labelOne,
    required this.iconOne,
    this.labelTwo,
    this.iconTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(iconOne, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              labelOne,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'PoppinsMedium',
              ),
            ),
          ],
        ),
        Row(
          children: [
            if (iconTwo != null && (labelTwo != null && labelTwo!.isNotEmpty)) ...[
              Icon(iconTwo, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                labelTwo!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
            ] else if (labelTwo != null && labelTwo!.isNotEmpty) ...[
              Text(
                labelTwo!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
