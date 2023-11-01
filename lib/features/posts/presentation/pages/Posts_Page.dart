import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/posts/posts_bloc.dart';
import 'Post_Add_Update.dart';

import '../widgets/Posts_Page/Message_Display_Widget.dart';
import '../widgets/Posts_Page/Post_List_Widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildbody(),
      floatingActionButton: _buildFloatBtn(context),
    );
  }

  AppBar _buildAppbar() => AppBar(
        title: Text("Posts"),
      );

  Widget _buildbody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                child: PostListWidget(post: state.posts),
                onRefresh: () => _onRefresh(context));
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(massage: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }

  Widget _buildFloatBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PostAddUpdate(
                      isUpdatapost: false,
                    )));
      },
      child: Icon(Icons.add),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }
}
