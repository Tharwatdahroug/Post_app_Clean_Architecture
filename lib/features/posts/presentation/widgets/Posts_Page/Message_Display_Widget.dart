// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String massage;
  MessageDisplayWidget({
    Key? key,
    required this.massage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            massage,
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
