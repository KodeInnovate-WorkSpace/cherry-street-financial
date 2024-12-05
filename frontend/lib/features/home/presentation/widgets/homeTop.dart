import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class HomeTop extends StatefulWidget {
  const HomeTop({super.key});

  @override
  State<HomeTop> createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 90),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Good Morning",
              style: poppinsRegular(
                color: AppColors.white,
              ),
            ),
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: _isOn,
                thumbColor: Colors.grey.shade300,
                trackColor: AppColors.white,
                onChanged: (bool value) {
                  setState(() {
                    _isOn = value;
                  });
                },
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(0, -8),
          child: Text(
            "Gerogia Abbey",
            style: poppinsBold(size: 26, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
