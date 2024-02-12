import 'package:flutter/material.dart';
import '../../../domain/model/model.dart';

enum CustomButtonType {
  addConcreteOrder, lockHesab,
}

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.data, this.onSelectItem})
      : super(key: key);
  final CustomButtonData data;
  final Function()? onSelectItem;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSelectItem,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.secondary.withAlpha(100),
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.maxFinite,
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.data.name,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              Image.asset(widget.data.image)
            ],
          ),
        ),
      ),
    );
  }
}
