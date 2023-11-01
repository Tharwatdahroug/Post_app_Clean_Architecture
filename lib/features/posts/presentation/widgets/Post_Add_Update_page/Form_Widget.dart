// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_Add_Update_page/Form_Submit_Btn.dart';
import 'package:posts_app/features/posts/presentation/widgets/Post_Add_Update_page/Text_Form_Field_Widget.dart';

class FormWidget extends StatefulWidget {
  final Post? post;
  final bool isUpdatapost;
  const FormWidget({
    Key? key,
    this.post,
    required this.isUpdatapost,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    if (widget.isUpdatapost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  void validateFormThenUpdateOrAddPost() {
    final isvalid = _formkey.currentState!.validate();
    if (isvalid) {
      final post = Post(
        id: widget.isUpdatapost ? widget.post!.id : null,
        title: _titleController.text,
        body: _bodyController.text,
      );
      if (widget.isUpdatapost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidget(
              name: "Title",
              multiLine: false,
              controller: _titleController,
            ),
            TextFormFieldWidget(
              name: "body",
              multiLine: true,
              controller: _bodyController,
            ),
            FormSubmitBtn(
                isUpdatapost: widget.isUpdatapost,
                onPressed: validateFormThenUpdateOrAddPost)
          ],
        ));
  }
}
