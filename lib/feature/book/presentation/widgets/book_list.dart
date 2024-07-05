import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_code_mobile/core/di/injection.dart';
import 'package:palm_code_mobile/feature/book/data/models/book.dart';
import 'package:palm_code_mobile/feature/book/presentation/manager/book_bloc.dart';
import 'package:palm_code_mobile/feature/book/presentation/pages/book_detail_page.dart';

class BookList extends StatefulWidget {
  final bool isLikedBooks;
  final bool isSearch;

  BookList({this.isLikedBooks = false, this.isSearch = false});

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    if (context.read<BookCubit>().state.books.isEmpty && !widget.isSearch) {
      getIt<BookCubit>().fetchBooks(query: _query, page: _page);
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !widget.isSearch) {
      getIt<BookCubit>().fetchBooks(query: _query, page: ++_page);
    }
  }

  List<Book> _getFilteredBooks(List<Book> books) {
    if (widget.isLikedBooks) {
      return books.where((book) => book.liked).toList();
    }
    return books;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      bloc: getIt<BookCubit>(),
      builder: (ctx, state) {
        final filteredBooks = _getFilteredBooks(state.books);

        return Column(
          children: [
            if (state.status == BookStatus.loading)
              Expanded(child: Center(child: CircularProgressIndicator()))
            else if (state.status == BookStatus.loaded ||
                state.status == BookStatus.pagination)
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    final book = filteredBooks[index];
                    final isLiked = book.liked;
                    return ListTile(
                      title: Text(book.title),
                      trailing: IconButton(
                        icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border),
                        onPressed: () {
                          getIt<BookCubit>().toggleLikeBook(index);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookDetailPage(book: book)),
                        );
                      },
                    );
                  },
                ),
              )
            else
              Expanded(child: Center(child: Text('Failed to load books'))),
          ],
        );
      },
    );
  }
}
