// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdatapost;
  FormSubmitBtn({
    Key? key,
    required this.onPressed,
    required this.isUpdatapost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: isUpdatapost ? Icon(Icons.edit) : Icon(Icons.add),
        label: Text(isUpdatapost ? "Update" : "Add"));
  }
}
