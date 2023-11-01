import 'package:flutter/material.dart';

class ShowSnackBar {
  void showSuccessSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showErrorSnackBa(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}




















//  ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 state.message,
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Colors.red,
//             ),
//           );