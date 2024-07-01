import 'package:flutter/material.dart';
import 'package:palm_code_mobile/feature/book/presentation/pages/book_search.dart';
import 'package:palm_code_mobile/feature/book/presentation/pages/liked_book_page.dart';
import 'package:palm_code_mobile/feature/book/presentation/widgets/book_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BookSearch());
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LikedBooksPage()),
              );
            },
          ),
        ],
      ),
      body: BookList(),
    );
  }
}
