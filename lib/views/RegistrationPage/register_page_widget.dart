import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../main.dart';
import '../../viewModels/register_page_view_controller.dart';
import '../../views/LoginPage/login_page_widget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class RegisterPageWidget extends StatelessWidget {
  RegisterPageWidget({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController murshidNameController = TextEditingController();
  final TextEditingController masjidNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterPageViewModel>(
      create: (context) => RegisterPageViewModel(),
      child: Consumer<RegisterPageViewModel>(
        builder: (con, registerModel, _) {
          if (registerModel.registerStatus == RegisterStatus.success) {
            return const NavigationTab();
          }
          else {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: AppBar(
                  title: Text(AppConfig().registrationPageHeading),
                  centerTitle: true,
                  backgroundColor: AppConfig().primaryColor,
                ),
              ),
              body: SafeArea(
                child: registerModel.registerStatus == RegisterStatus.loading
                    ? const SizedBox(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: nameController,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Name',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: emailController,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Email',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        obscureText: true,
                                        controller: passwordController,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Password',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 10,
                                              top: 5.0,
                                              bottom: 5.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.50,
                                            child: TextFormField(
                                              autofocus: false,
                                              enabled: false,
                                              controller: dobController,
                                              style: const TextStyle(
                                                  color: Colors.black, fontSize: 18),
                                              decoration: const InputDecoration(
                                                  hintText: 'dd/mm/yyyy',
                                                  contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 0.0),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 0.0),
                                                  )),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                minTime: DateTime(1945 , 3, 5),
                                                maxTime: DateTime(2045 , 7, 7),
                                                onConfirm: (date) {
                                                  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
                                                  dobController.text = formattedDate;
                                                },
                                                currentTime: DateTime.now(),
                                                locale: LocaleType.en);
                                          },
                                          child: const Text('Select Date'),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                            ),
                                            padding: const EdgeInsets.all(15),
                                            primary: AppConfig().primaryColor,
                                          ),
                                        ),

                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        focusColor: Colors.white,
                                        value: registerModel.ahle,
                                        //elevation: 5,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        iconEnabledColor: Colors.black,
                                        items: [
                                          'Select Ahle Khandan',
                                          'Sayed',
                                          'Pathan',
                                          'Ansari',
                                          'Sheikh'
                                        ].map<DropdownMenuItem<String>>(
                                            (String typeValue) {
                                          return DropdownMenuItem<String>(
                                            value: typeValue,
                                            child: Text(
                                              typeValue,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          if (newValue! !=
                                              'Select Ahle Khandan') {
                                            registerModel
                                                .setAhleValue(newValue);
                                          }
                                        },
                                        hint: const Text(
                                          'Select Ahle Khandan',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: murshidNameController,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Murshid Name',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: masjidNameController,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Masjid Name',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (nameController.text.isNotEmpty &&
                                              emailController.text.isNotEmpty &&
                                              registerModel.ahle !=
                                                  'Select Ahle Khandan' &&
                                              masjidNameController
                                                  .text.isNotEmpty &&
                                              masjidNameController
                                                  .text.isNotEmpty &&
                                              dobController.text.isNotEmpty) {
                                            registerModel.register(
                                                nameController.text,
                                                dobController.text,
                                                emailController.text,
                                                passwordController.text,
                                                murshidNameController.text,
                                                masjidNameController.text);
                                          } else {
                                            final snackBar = SnackBar(
                                              content: const Text(
                                                'Empty Fields....',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                              backgroundColor:
                                                  (AppConfig().primaryColor),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        child: const Text('Sign Up'),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          primary: AppConfig().primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPageWidget()));
                                        },
                                        child: const Text('Sign In'),
                                      ),
                                    ),
                                    registerModel.registerStatus == RegisterStatus.failed ?
                                        const Text('Something went wrong', style: TextStyle(color: Colors.red),)
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            );
          }
        },
      ),
    );
  }
}
