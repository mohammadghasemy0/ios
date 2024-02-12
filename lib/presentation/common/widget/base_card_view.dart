import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView(
      {Key? key,
      required this.child,
      required this.title,
      required this.iconName})
      : super(key: key);
  final Widget child;
  final String title;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(iconName, height: 42, width: 42),
                const SizedBox(
                  width: 16,
                ),
                Expanded(child: Text(title, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis)),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
