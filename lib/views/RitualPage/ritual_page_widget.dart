import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/ritual_view_model.dart';
import 'package:noor/views/RitualPage/Widget/ritual_list_container_widget.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class RitualPageWidget extends StatelessWidget {
  const RitualPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<RitualViewModel>(context, listen: false).fetch();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().ritualPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: Consumer<RitualViewModel>(
          builder: (con, ritualModel, _) {
            return ritualModel.status == Status.loading
                ? const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : ritualModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            ritualModel.error.message,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : ritualModel.status == Status.success &&
                            ritualModel.ritualList.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'No Ritual Found.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : ritualModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  itemCount: ritualModel.ritualList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return RitualListContainer(
                                      ritualModel:
                                          ritualModel.ritualList[index],
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
