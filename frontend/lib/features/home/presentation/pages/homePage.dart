import 'package:cherrystreet/constants/size.dart';
import 'package:cherrystreet/features/home/presentation/widgets/homeTop.dart';
import 'package:cherrystreet/constants/colors.dart';
import 'package:cherrystreet/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/transactionCubit.dart';
import '../widgets/newsCard.dart';
import '../widgets/planningCard.dart';
import '../widgets/spendingCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionCubit>().fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backgroundClr,
        body: Stack(
          children: [
            Container(
              width: getScreenWidth(context),
              height: getScreenHeight(context) / 2.5,
              decoration: const BoxDecoration(
                color: AppColors.primaryClr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeTop(),
                  Transform.translate(
                    offset: const Offset(-16, 0),
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      labelColor: AppColors.white,
                      unselectedLabelColor: Colors.grey.shade200,
                      labelStyle: poppinsBold(size: 15),
                      unselectedLabelStyle: poppinsMedium(size: 15),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      tabs: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Tab(text: "Spending"),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Tab(text: "Planning"),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Tab(text: "News"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(0, -16),
                      child: const TabBarView(
                        children: [
                          SpendingCard(),
                          PlanningCard(),
                          NewsCard(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
