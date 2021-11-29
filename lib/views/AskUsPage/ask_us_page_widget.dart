import 'package:flutter/material.dart';

import '../../config.dart';

class AskUsPageWidget extends StatelessWidget {
  AskUsPageWidget({Key? key}) : super(key: key);

  final TextEditingController questionController = TextEditingController();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Question',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
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
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                    hintText: 'Enter Question Here......',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                  style:
                      ElevatedButton.styleFrom(primary: AppConfig().primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
