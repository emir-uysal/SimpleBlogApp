import 'package:blog/pages/blog_detail_page.dart';
import 'package:blog/pages/new_blog_page.dart';
import 'package:flutter/material.dart';

class BlogListPage extends StatefulWidget {
  @override
  _BlogListPageState createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  List<Map<String, String>> blogs = [];

  void _navigateToNewBlogPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewBlogPage()),
    );

    if (result != null) {
      setState(() {
        blogs.add(result);
      });
    }
  }

  void _navigateToBlogDetailPage(Map<String, String> blog) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BlogDetailPage(blog: blog)),
    );
  }

  void _deleteBlog(int index) {
    setState(() {
      blogs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Listesi', style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(blogs[index]['title'] ?? ''),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              _deleteBlog(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Blog yazısı silindi')),
              );
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: Card(
              child: ListTile(
                title: Text(blogs[index]['title'] ?? ''),
                subtitle: Text(blogs[index]['content'] ?? ''),
                onTap: () => _navigateToBlogDetailPage(blogs[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNewBlogPage,
        child: Icon(Icons.add),
      ),
    );
  }
}