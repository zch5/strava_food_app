import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/create_pages/create_post_page_view_model.dart';

class MediaView extends StatefulWidget {
  const MediaView({super.key});
  @override
  _MediaView createState() => _MediaView();
}

class _MediaView extends State<MediaView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: context.watch<CreatePostPageViewModel>().images.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  context.watch<CreatePostPageViewModel>().imageStorage[i],
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                  },
                ),
              ),
              Visibility(
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Divider(),
                ),
                visible: i < context.watch<CreatePostPageViewModel>().images.length - 1,
              )
            ],
          );
        },
      ),
    );
  }
}