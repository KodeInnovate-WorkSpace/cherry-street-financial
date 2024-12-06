import 'package:cherrystreet/common/customProgressBar.dart';
import 'package:cherrystreet/constants/colors.dart';
import 'package:cherrystreet/constants/fonts.dart';
import 'package:cherrystreet/constants/size.dart';
import 'package:flutter/material.dart';

class PlanningCard extends StatelessWidget {
  const PlanningCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 14,
            ),
            Container(
              width: 340,
              height: 230,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Play Zone",
                      style: poppinsBold(
                        size: 16,
                        color: AppColors.primaryClr,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended\nScenario",
                          style: poppinsMedium(size: 16),
                        ),
                        Text(
                          "63%",
                          style: poppinsBold(size: 34),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Total spending: ",
                              style: poppinsRegular(size: 14),
                              children: [
                                TextSpan(
                                  text: "\$3,562,998",
                                  style: poppinsBold(size: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const CustomProgressBar(),
                          const SizedBox(height: 20),
                          Text(
                            "You are below the Confidence Zone",
                            style: poppinsRegular(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 340,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Goal Planning",
                      style: poppinsBold(
                        size: 16,
                        color: AppColors.primaryClr,
                      ),
                    ),
                    Container(
                      height: getScreenHeight(context) / 3.9,
                      width: getScreenWidth(context),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  child: Icon(Icons.monetization_on_outlined),
                                ),
                                const SizedBox(width: 14),
                                Text(
                                  "Living Expenses",
                                  style: poppinsBold(),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "2040-2044",
                                    style: poppinsMedium(size: 14),
                                  ),
                                  Text(
                                    "\$72,420/yr",
                                    style: poppinsSemiBold(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "2045-2067",
                                    style: poppinsMedium(size: 14),
                                  ),
                                  Text(
                                    "\$151,486/yr",
                                    style: poppinsSemiBold(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "2068-2072",
                                    style: poppinsMedium(size: 14),
                                  ),
                                  Text(
                                    "\$121,389/yr",
                                    style: poppinsSemiBold(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
