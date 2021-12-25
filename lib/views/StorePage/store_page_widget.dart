import 'package:flutter/material.dart';
import '../../helpers/enum.dart';
import '../../viewModels/store_page_view_model.dart';
import '../../views/StorePage/Widget/list_view_item_widget.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class StorePageWidget extends StatelessWidget {
  const StorePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StorePageViewModel>(context, listen: false).fetchProductList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().storePageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: Consumer<StorePageViewModel>(
        builder: (con, storePageModel, _) {
          return storePageModel.status == Status.loading
              ? const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                )
              : storePageModel.status == Status.error
                  ? SizedBox(
                      child: Center(
                        child: Text(
                          storePageModel.error.message,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    )
                  : storePageModel.status == Status.success &&
                          storePageModel.products.isEmpty
                      ? const SizedBox(
                          child: Center(
                            child: Text(
                              'No Books Added.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        )
                      : storePageModel.status == Status.success
                          ? SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.10),
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing: 1.0,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: storePageModel.products.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return StoreListItemWidget(imageLink: storePageModel.products[index].productImage, productTitle: storePageModel.products[index].productTitle, productAbout: storePageModel.products[index].productAbout, productItemCode: storePageModel.products[index].productItemCode);
                                },
                              ),
                            )
                          : const SizedBox();
        },
      ),
    );
  }
}
