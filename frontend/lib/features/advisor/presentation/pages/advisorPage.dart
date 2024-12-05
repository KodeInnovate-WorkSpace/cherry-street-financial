import 'package:cherrystreet/features/advisor/presentation/widgets/AboutActions.dart';
import 'package:cherrystreet/features/advisor/presentation/widgets/aboutSection.dart';
import 'package:cherrystreet/features/advisor/presentation/widgets/aboutTop.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/colors.dart';
import 'package:flutter/material.dart';
import '../state/advisorCubit.dart';
import '../state/advisorState.dart';

class AdvisorPage extends StatelessWidget {
  const AdvisorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdvisorCubit>().fetchAdvisor();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight / 3.8,
            decoration: const BoxDecoration(
              color: AppColors.primaryClr,
            ),
          ),
          BlocBuilder<AdvisorCubit, AdvisorState>(builder: (context, state) {
            if (state is AdvisorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AdvisorError) {
              return const Center(child: Text('Failed to load advisor data.'));
            } else if (state is AdvisorFetched) {
              final advisorData = state.advisor;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 85),
                          AboutTop(advisor: advisorData),
                          const SizedBox(height: 25),
                          AboutActionSection(advisor: advisorData),
                          const SizedBox(height: 84),
                          AboutSection(advisor: advisorData),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
