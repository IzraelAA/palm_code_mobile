import 'package:flutter/material.dart';
import 'package:palm_code_mobile/core/di/injection.dart';
import 'package:palm_code_mobile/feature/book/presentation/manager/book_bloc.dart';
import 'package:palm_code_mobile/feature/book/presentation/widgets/book_list.dart';

class BookSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    getIt<BookCubit>().fetchBooks(
      query: query,
      page: 1,
    );
    return BookList(isSearch: true,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
