import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/ask_us_view_model.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class AskUsPageWidget extends StatelessWidget {
  AskUsPageWidget({Key? key}) : super(key: key);

  final TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<AskUsViewModel>(context, listen: false).init();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().askUsPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: Consumer<AskUsViewModel>(
        builder: (con, askViewModel, _) {
          return askViewModel.status == Status.loading
              ? const Center(child: CircularProgressIndicator())
              : askViewModel.userStatus == HomePageUserStatus.userNotVerified
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Please login to submit questions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Question',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: false,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: questionController,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: const InputDecoration(
                                  hintText: 'Enter Question Here......',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (questionController.text.isNotEmpty) {
                                    askViewModel.updateAskQuestion(
                                        questionController.text);
                                  } else {
                                    final snackBar = SnackBar(
                                      content: const Text(
                                        'Empty Fields....',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      backgroundColor:
                                          (AppConfig().primaryColor),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                child: const Text('Submit'),
                                style: ElevatedButton.styleFrom(
                                    primary: AppConfig().primaryColor),
                              ),
                            ),
                            askViewModel.status == Status.success ?
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'SuccessFully Submitted',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold,color: Colors.red),
                              ),
                            ) : const SizedBox(),
                            askViewModel.status == Status.error ?
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Something went wrong..',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                            ) : const SizedBox(),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
