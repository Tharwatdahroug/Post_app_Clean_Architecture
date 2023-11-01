import 'package:flutter/material.dart';
import '../app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        heightFactor: 30,
        widthFactor: 30,
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      ),
    );
  }
}
