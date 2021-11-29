import 'package:flutter/material.dart';
import 'package:noor/views/StorePage/Widget/list_view_item_widget.dart';

import '../../config.dart';

class StorePageWidget extends StatelessWidget {
  const StorePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().askUsPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.15),
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return const StoreListItemWidget();
            },
          ),
        ),
      ),
    );
  }
}
