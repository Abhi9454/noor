import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/quran_view_model.dart';
import 'package:noor/views/QuranPage/Widget/quran_list_container_widget.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<QuranViewModel>(context, listen: false).fetch();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().quranPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: Consumer<QuranViewModel>(
          builder: (con, quranModel, _) {
            return quranModel.status == Status.loading
                ? const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : quranModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            quranModel.error.message,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : quranModel.status == Status.success &&
                            quranModel.quranList.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'No Quran Found.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : quranModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  itemCount: quranModel.quranList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return QuranListContainer(
                                      quranModel: quranModel.quranList[index],
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
