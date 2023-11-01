// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/util/snackbar_message.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/Posts_Page.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_details_Page/Delete_Dialog.dart';

class DeletePostBtnWidget extends StatelessWidget {
  final int postId;
  const DeletePostBtnWidget({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.redAccent),
        ),
        onPressed: () => deleteDialog(context),
        icon: const Icon(Icons.delete),
        label: const Text("Delete"));
  }

  void deleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddDeleteUpdatePostBloc,
              AddDeleteUpdatePostState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is MessageAddDeleteUpdatePostState) {
                ShowSnackBar().showSuccessSnackBar(
                    message: state.message, context: context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const PostsPage()),
                    (route) => false);
              } else if (state is ErrorAddDeleteUpdatePostState) {
                Navigator.of(context).pop();
                ShowSnackBar()
                    .showErrorSnackBa(message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddDeleteUpdatePostState) {
                return AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDialogWidget(postId: postId);
            },
          );
        });
  }
}
