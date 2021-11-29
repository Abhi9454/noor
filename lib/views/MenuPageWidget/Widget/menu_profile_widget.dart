import 'package:flutter/material.dart';
import '../../LoginPage/login_page_widget.dart';
class MenuProfileWidget extends StatelessWidget {
  const MenuProfileWidget({required this.imageLink, required this.userName,Key? key}) : super(key: key);

  final String imageLink;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginPageWidget()));
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(imageLink),
            ),
            title: Text(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            subtitle: Text(
              'Click to edit profile',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            dense: true,
          ),
        ),
      ),
    );
  }
}
