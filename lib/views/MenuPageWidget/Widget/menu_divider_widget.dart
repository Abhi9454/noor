import 'package:flutter/material.dart';


class MenuDividerWidget extends StatelessWidget {
  const MenuDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Divider(
        color: Colors.black54,
      ),
    );
  }
}
