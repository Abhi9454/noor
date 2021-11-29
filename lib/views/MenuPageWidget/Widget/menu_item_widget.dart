import 'package:flutter/material.dart';

import '../../../config.dart';


class MenuItemWidget extends StatelessWidget {

  const MenuItemWidget({required this.icon, required this.itemName,Key? key}) : super(key: key);
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
          const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 18,
                color: AppConfig().primaryColor,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                children: <Widget>[
                  Text(
                    itemName,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
