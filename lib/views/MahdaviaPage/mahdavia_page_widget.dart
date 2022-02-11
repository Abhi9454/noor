import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/mahdavia_view_model.dart';
import '../../config.dart';
import 'package:provider/provider.dart';

import 'Widget/mahdavia_list_container_widget.dart';

class MahdaviaPageWidget extends StatelessWidget {
  const MahdaviaPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MahdaviaViewModel>(context, listen: false).fetchMahdavia();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().mahdaviaPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: Consumer<MahdaviaViewModel>(
          builder: (con, mahdaviaModel, _) {
            return mahdaviaModel.status == Status.loading
                ? const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : mahdaviaModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            mahdaviaModel.error.message,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : mahdaviaModel.status == Status.success &&
                            mahdaviaModel.mahdaviaDetails.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'No Video Found.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : mahdaviaModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  itemCount:
                                      mahdaviaModel.mahdaviaDetails.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return MahdaviaListContainer(
                                      mahdaviaModel:
                                          mahdaviaModel.mahdaviaDetails[index],
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
