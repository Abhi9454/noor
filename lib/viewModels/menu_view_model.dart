import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/read_user_details.dart';

class MenuViewModel extends ChangeNotifier{
  late String userName;
  bool isUserExist = false;
  final UserDetails _userDetails = UserDetails();

  fetchUserName() async{
    userName = await _userDetails.getUserFullName();
    if(userName.isNotEmpty){
      isUserExist = true;
    }
    notifyListeners();
  }
}