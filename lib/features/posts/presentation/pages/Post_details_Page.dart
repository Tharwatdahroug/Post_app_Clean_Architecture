// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_details_Page/Post_Details_Widget.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildbody(),
    );
  }

  AppBar _buildAppbar() => AppBar(
        title: Text("Posts"),
      );

  Widget _buildbody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PosttDetailsWidget(post: post),
      ),
    );
  }
}
