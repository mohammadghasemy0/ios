import 'package:flutter/material.dart';
import '/domain/model/model.dart';
import '../../resources/assets_manager.dart';
import 'base_card_view.dart';

class InnerReportItemCardView extends StatefulWidget {
  const InnerReportItemCardView(
      {Key? key, required this.data, this.isExpanded = false})
      : super(key: key);
  final ReportItemData data;
  final bool isExpanded;

  @override
  State<InnerReportItemCardView> createState() =>
      _InnerReportItemCardViewState();
}

class _InnerReportItemCardViewState extends State<InnerReportItemCardView> {
  bool isExpanded = false;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.data.title,
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis),
          ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            // physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemCount: widget.data.items.length,
            itemBuilder: (context, index) => Column(children: [
              Row(
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    widget.data.items[index].key,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.end,
                      widget.data.items[index].value,
                      style: widget.data.items[index].color != null
                          ? Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: widget.data.items[index].color)
                          : Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.data.items[index].list != null)
                    if (widget.data.items[index].list!.isNotEmpty)
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(isExpanded
                            ? Icons.arrow_drop_up_rounded
                            : Icons.arrow_drop_down_rounded),
                      ),
                ],
              ),
              if (isExpanded && widget.data.items[index].list != null)
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index2) => InnerReportItemCardView(
                        data: widget.data.items[index].list![index2]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: widget.data.items[index].list!.length),
            ]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ],
      ),
    );
  }
}
