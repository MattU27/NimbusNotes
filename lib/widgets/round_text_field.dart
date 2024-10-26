import 'package:flutter/material.dart';

import '/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.accentPurple,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: const TextStyle(
          color: AppColors.paleLilac,
        ),
        controller: controller,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.softLavender,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: AppColors.softLavender,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
