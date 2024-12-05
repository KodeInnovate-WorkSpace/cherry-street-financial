import 'package:cherrystreet/constants/colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData labelIcon;
  final Future<void> Function()? onClick;

  const ActionButton({
    super.key,
    required this.label,
    required this.labelIcon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick != null
          ? () async {
              await onClick!();
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              labelIcon,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'PoppinsMedium',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
