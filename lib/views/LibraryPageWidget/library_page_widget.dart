import 'package:flutter/material.dart';
import '../../viewModels/library_view_model.dart';
import '../../views/LibraryPageWidget/Widget/library_list_item_widget.dart';
import '../../helpers/enum.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class LibraryPageWidget extends StatelessWidget {
  const LibraryPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<LibraryViewModel>(context, listen: false).fetchBooks();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().askUsPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: Consumer<LibraryViewModel>(
        builder: (con, libraryBookModel, _) {
          return libraryBookModel.status == Status.loading
              ? const SizedBox(
            child: Center(child: CircularProgressIndicator()),
          )
              : libraryBookModel.status == Status.error
              ? SizedBox(
            child: Center(
              child: Text(
                libraryBookModel.error.message,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              : libraryBookModel.status == Status.success &&
              libraryBookModel.books.isEmpty
              ? const SizedBox(
            child: Center(
              child: Text(
                'No Service History Added.',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              : libraryBookModel.status == Status.success
              ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio:
                MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height /
                        1.15),
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: libraryBookModel.books.length,
              itemBuilder: (BuildContext ctx, index) {
                return LibraryListItemWidget(bookLink: libraryBookModel.books[index].bookPath, bookTitle: libraryBookModel.books[index].bookTitle, bookLanguage: libraryBookModel.books[index].bookLanguage, bookPublishDate: libraryBookModel.books[index].bookPublishDate);
              },
            ),
          )
              : const SizedBox();
        },
      ),
    );
  }
}