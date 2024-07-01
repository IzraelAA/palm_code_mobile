import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_code_mobile/core/di/injection.dart';
import 'package:palm_code_mobile/feature/book/presentation/manager/book_bloc.dart';
import 'package:palm_code_mobile/feature/book/presentation/widgets/book_list.dart';

class LikedBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liked Books')),
      body: BookList(isLikedBooks: true),
    );
  }
}
