// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:posts_app/core/util/snackbar_message.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';

import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/Post_Add_Update.dart';
import 'package:posts_app/features/posts/presentation/pages/Posts_Page.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_details_Page/Delete_Dialog.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_details_Page/Delete_Post_Btn_Widget.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_details_Page/Update_Post_Btn_Widget.dart';

class PosttDetailsWidget extends StatelessWidget {
  final Post post;
  const PosttDetailsWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              height: 50,
            ),
            Text(
              post.body,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Divider(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UpdatePostBtnWidget(post: post),
                DeletePostBtnWidget(postId: post.id!),
              ],
            )
          ],
        ));
  }
}
