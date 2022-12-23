import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/dua_view_model.dart';
import 'package:noor/views/DuaModel/Widget/dua_list_container_page_widget.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class DuaPageWidget extends StatelessWidget {
  const DuaPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DuaViewModel>(context, listen: false).fetch();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().duaPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: Consumer<DuaViewModel>(
          builder: (con, duaModel, _) {
            return duaModel.status == Status.loading
                ? const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : duaModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            duaModel.error.message,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : duaModel.status == Status.success &&
                            duaModel.duaList.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'No Dua Found.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : duaModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  itemCount: duaModel.duaList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return DuaListContainer(
                                      duaModel: duaModel.duaList[index],
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
