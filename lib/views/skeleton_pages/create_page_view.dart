import 'package:flutter/material.dart';

class CreatePageView extends StatefulWidget {
  const CreatePageView({super.key});
  @override
  _CreatePageView createState() => _CreatePageView();
}

class _CreatePageView extends State<CreatePageView> {
  // TODO: Implement overlay here
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: null,
            icon: Icon(
              Icons.post_add
            ),
            label: Text('Post')),
          ElevatedButton.icon(
              onPressed: null,
              icon: Icon(
                  Icons.post_add
              ),
              label: Text('Challange')),
          ElevatedButton.icon(
              onPressed: null,
              icon: Icon(
                  Icons.post_add
              ),
              label: Text('Recipe'))
        ],
      ),
    );
  }
}