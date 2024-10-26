import 'package:flutter/material.dart';

import '/constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.deepCharcoal,
              AppColors.mutedSlate,
              AppColors.mutedSlate.withOpacity(.99),
              AppColors.mutedSlate.withOpacity(.98),
              AppColors.mutedSlate.withOpacity(.97),
              AppColors.mutedSlate.withOpacity(.96),
              AppColors.mutedSlate.withOpacity(.95),
              AppColors.mutedSlate.withOpacity(.94),
              AppColors.mutedSlate.withOpacity(.93),
              AppColors.mutedSlate.withOpacity(.92),
              AppColors.mutedSlate.withOpacity(.91),
              AppColors.mutedSlate.withOpacity(.90),
              AppColors.darkPurple,
              AppColors.accentPurple,
              AppColors.lightPurple,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 36.0,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
