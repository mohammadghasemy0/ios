import 'package:flutter/material.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu(
      {Key? key,
      this.leading,
      this.trailing,
      required this.title,
      this.subTitle,
      this.onTap})
      : super(key: key);
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Card(
            child: leading ??
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded)),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 60,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                    children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: onTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title, overflow: TextOverflow.ellipsis),
                          if (subTitle != null)
                            Text(
                              subTitle!,
                              style: Theme.of(context).textTheme.caption,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (trailing != null) trailing!,
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
