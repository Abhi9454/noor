import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/news_view_model.dart';
import 'package:noor/views/NewsPage/Widget/news_list_container_list.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class NewsPageWidget extends StatelessWidget {
  const NewsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<NewsViewModel>(context, listen: false).fetch();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().newsPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: Consumer<NewsViewModel>(
          builder: (con, newsModel, _) {
            return newsModel.status == Status.loading
                ? const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : newsModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            newsModel.error.message,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : newsModel.status == Status.success &&
                            newsModel.newsList.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'No News Found.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : newsModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  itemCount: newsModel.newsList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return NewsListContainer(
                                      newsModel: newsModel.newsList[index],
                                    );
                                  },
                                ),
                              )
                            : const SizedBox();
          },
        ),
      ),
    );
  }
}
