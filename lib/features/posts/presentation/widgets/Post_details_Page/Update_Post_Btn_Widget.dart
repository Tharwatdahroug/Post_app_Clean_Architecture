// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/pages/Post_Add_Update.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Post post;
  const UpdatePostBtnWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PostAddUpdate(
                        isUpdatapost: true,
                        post: post,
                      )));
        },
        icon: const Icon(Icons.edit),
        label: const Text("Edit"));
  }
}
