// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/util/snackbar_message.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';

import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/Posts_Page.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_Add_Update_page/Form_Widget.dart';

class PostAddUpdate extends StatelessWidget {
  final Post? post;
  final bool isUpdatapost;
  const PostAddUpdate({
    Key? key,
    this.post,
    required this.isUpdatapost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildbody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(isUpdatapost ? "Edit Post" : "Add Post"),
    );
  }

  Widget _buildbody() {
    return BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
      listener: (context, state) {
        if (state is MessageAddDeleteUpdatePostState) {
          ShowSnackBar()
              .showSuccessSnackBar(message: state.message, context: context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const PostsPage()),
              (route) => false);
        } else if (state is ErrorAddDeleteUpdatePostState) {
          ShowSnackBar()
              .showErrorSnackBa(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        if (state is LoadingAddDeleteUpdatePostState) {
          return const LoadingWidget();
        }
        return FormWidget(
            isUpdatapost: isUpdatapost, post: isUpdatapost ? post : null);
      },
    );
  }
}
