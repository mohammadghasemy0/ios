import 'package:flutter/material.dart';
import '/domain/model/model.dart';

class ReportListView extends StatelessWidget {
  const ReportListView({Key? key, required this.data, this.onSelectItem})
      : super(key: key);
  final ReportListViewData data;
  final Function(ReportListViewItem item)? onSelectItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 24, bottom: 4),
              child: Text(
                data.title,
                style: Theme.of(context).textTheme.subtitle1,
              )),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 4),
              scrollDirection: Axis.horizontal,
              itemCount: data.items.length,
              itemBuilder: (context, index) => AspectRatio(
                  aspectRatio: 1.3,
                  child: _moduleItem(
                      context,
                      data.items[index].name,
                      data.items[index].image,
                      onSelectItem != null
                          ? () => onSelectItem!(data.items[index])
                          : null,
                      true)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moduleItem(BuildContext context, String title, String assetIcon,
      Function()? onTap, bool isActive) {
    return InkWell(
      onTap: isActive ? onTap : () {},
      child: Card(
        child: Stack(alignment: Alignment.center, children: [
          if (!isActive) Container(color: Colors.black12),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 2),
                      child: Image.asset(assetIcon)),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
