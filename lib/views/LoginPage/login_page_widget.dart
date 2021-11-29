import 'package:flutter/material.dart';

import '../../config.dart';

class LoginPageWidget extends StatelessWidget {
  LoginPageWidget({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().loginPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              child: Image(
                image: const AssetImage(
                  'images/logo.png', //header logo image
                ),
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.27,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        autofocus: false,
                        controller: emailController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        controller: passwordController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              emailController.text.isNotEmpty) {
                          } else {
                            final snackBar = SnackBar(
                              content: const Text(
                                'Empty Fields....',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              backgroundColor: (AppConfig().primaryColor),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.all(15),
                          primary: AppConfig().primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {}, child: const Text('Forget Password'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
