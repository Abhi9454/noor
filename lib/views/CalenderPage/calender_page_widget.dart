import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/calender_view_model.dart';
import 'package:noor/views/CalenderPage/Widget/calender_list_container.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class CalenderPageWidget extends StatelessWidget {
  const CalenderPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<CalenderViewModel>(context, listen: false).fetchCalender();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().calenderPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: Consumer<CalenderViewModel>(
        builder: (con, calenderPageModel, _) {
          return calenderPageModel.status == Status.loading ?
          const Center(child: CircularProgressIndicator(),) : SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.builder(
                itemCount: calenderPageModel.calenderDetails.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CalenderListContainer(
                      calenderDate:
                      calenderPageModel.calenderDetails[index].calenderDate,
                      calenderDetails: calenderPageModel
                          .calenderDetails[index].calenderDetails);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
