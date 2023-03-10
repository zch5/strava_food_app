import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/create_pages/create_post_page_view_model.dart';
import '../shared_pages/app_bar_skeleton.dart';
import '../shared_pages/media_view.dart';

class CreatePostPageView extends StatefulWidget {
  const CreatePostPageView({super.key});
  @override
  _CreatePostPageViewState createState() => _CreatePostPageViewState();
}

class _CreatePostPageViewState extends State<CreatePostPageView> {
  late final titleController;
  late final descriptionController;

  _CreatePostPageViewState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSkeleton(
        title: 'Add Post',
        showBackButton: true,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              context.read<CreatePostPageViewModel>().createPost(titleController.text, descriptionController.text);
              Navigator.pop(context);
            },
            label: Text('Publish'),
            icon: Icon(Icons.publish),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Form(
              child: TextFormField(
                controller: titleController,
                maxLength: 50,
                decoration: InputDecoration(labelText: 'Title'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (title) =>
                title != null && title.length < 5
                    ? 'Enter a valid title' : null,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Form(
              child: TextFormField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: 500,
                decoration: InputDecoration(labelText: 'Description'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (description) =>
                description != null && description.length < 5
                    ? 'Enter a valid title' : null,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () async {
                      final results = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['png', 'jpg'],
                      );

                      if (results == null) {
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                               content: Text('No file selected.')
                           ),
                         );
                      }

                      final path = results?.files.single.path!;
                      final fileName = results?.files.single.name;
                      context.read<CreatePostPageViewModel>().addImage(path!, fileName!);
                      //storage.uploadFile(path!, fileName!).then((value) => print('done'));
                    },
                    icon: Icon(Icons.image)
                ),
                IconButton(
                    onPressed: null,
                    icon: Icon(Icons.menu_book)
                ),
              ],
            ),
          ),
          Container(
              child: MediaView(),
          ),
        ],
      ),
    );
  }
}