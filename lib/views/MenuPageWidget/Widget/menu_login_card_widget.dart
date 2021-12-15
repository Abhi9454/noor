import 'package:flutter/material.dart';
class MenuLoginCardWidget extends StatelessWidget {
  const MenuLoginCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             RegisterPageWidget()));
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          elevation: 2,
          child: ListTile(
            leading: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://bootspider.com/demo-site/noor/assets/images/user-sm/8.jpg'),
            ),
            title: const Text(
              'Welcome User',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
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
