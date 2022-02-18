import 'package:flutter/material.dart';

import '../vakinha_ui.dart';

class IconBadge extends StatelessWidget {
  final int number;
  final IconData icon;

  const IconBadge({
    Key? key,
    required this.number,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: number > 0,
      child: Positioned(
        top: 0,
        right: 0,
        child: Stack(
          children: [
            Icon(icon),
            CircleAvatar(
              maxRadius: 9,
              backgroundColor: Colors.red,
              child: Text(
                number.toString(),
                style: VakinhaUI.textBold.copyWith(
                  fontSize: 9,
                )
              )),
          ],
        ),
      ),
    );
  }
}