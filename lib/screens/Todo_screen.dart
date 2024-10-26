import 'package:flutter/material.dart';


import '/constants/text_styles.dart';
import '/views/gradient_container.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the top
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'To Do in Case of Typhoon',
                  style: TextStyles.h1, // Use the same style as the title in ForecastReportScreen
                  textAlign: TextAlign.left, // Align text to the left
                ),
              ),
              SizedBox(height: 40), // Spacing
            ],
          ),
        ),
      ],
    );
  }
}
