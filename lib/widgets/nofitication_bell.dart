import 'package:flutter/material.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(
              Icons.notification_important,
            ),
            Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).splashColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
