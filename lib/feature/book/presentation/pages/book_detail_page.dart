import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_code_mobile/core/di/injection.dart';
import 'package:palm_code_mobile/feature/book/data/models/book.dart';
import 'package:palm_code_mobile/feature/book/presentation/manager/book_bloc.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Author: ${book.authors.map((author) => author.name).join(
                      ', ')}'),
              SizedBox(height: 8),
              Text('Subjects: ${book.subjects.join(', ')}'),
              SizedBox(height: 16),
              Text('Languages: ${book.languages.join(', ')}'),
              SizedBox(height: 16),
              Text('Download Count: ${book.downloadCount}'),
              SizedBox(height: 16),
              BlocBuilder<BookCubit, BookState>(
                bloc: getIt<BookCubit>(),
                builder: (context, state) {
                  bool isLiked = false;
                  if (state.status == BookStatus.loaded) {
                    isLiked = book.liked;
                  }
                  return ElevatedButton(
                      onPressed: () {
                        // Dispatch ToggleLikeBook event to toggle like status

                        final index = state.books.indexWhere((b) =>
                        b.id == book.id);
                        getIt<BookCubit>().toggleLikeBook(index);
                      },
                      child:
                      Text(isLiked ? 'Dislike' : 'Like')
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
