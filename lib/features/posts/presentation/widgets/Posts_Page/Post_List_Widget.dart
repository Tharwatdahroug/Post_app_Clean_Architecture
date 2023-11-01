// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/pages/Post_details_Page.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> post;
  PostListWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(post[index].id.toString()),
            title: Text(
              post[index].title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              post[index].body,
              style: TextStyle(fontSize: 16),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PostDetails(
                            post: post[index],
                          )));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
          );
        },
        itemCount: post.length);
  }
}
