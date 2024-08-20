import 'package:flutter/material.dart';

class NewBlogPage extends StatefulWidget {
  @override
  _NewBlogPageState createState() => _NewBlogPageState();
}

class _NewBlogPageState extends State<NewBlogPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _saveBlog() {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      Navigator.pop(context, {
        'title': _titleController.text,
        'content': _contentController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Blog Yazısı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Başlık'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'İçerik'),
              maxLines: 8,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveBlog,
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}