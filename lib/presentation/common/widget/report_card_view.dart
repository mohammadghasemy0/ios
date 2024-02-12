import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/domain/model/model.dart';
import '../../resources/assets_manager.dart';
import 'base_card_view.dart';
import 'inner_report_card_view.dart';

class ReportItemCardView extends StatefulWidget {
  const ReportItemCardView(
      {Key? key, required this.data, this.isExpanded = false})
      : super(key: key);
  final ReportItemData data;
  final bool isExpanded;

  @override
  State<ReportItemCardView> createState() => _ReportItemCardViewState();
}

class _ReportItemCardViewState extends State<ReportItemCardView> {
  bool isExpanded = false;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardView(
        title: widget.data.title,
        iconName: ImageAssets.clReport3,
        child: Column(children: [
          if(widget.data.imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AspectRatio(
                aspectRatio: 1.35,
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  width: double.maxFinite,
                  imageUrl: widget.data.imageUrl!,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          if(widget.data.imageUrl2 != null)
            AspectRatio(
              aspectRatio: 4,
              child: CachedNetworkImage(
                fit: BoxFit.fitWidth,
                width: double.maxFinite,
                imageUrl: widget.data.imageUrl2!,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            // physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemCount: widget.data.items.length,
            itemBuilder: (context, index) => Column(children: [
              GestureDetector(
                onTap: () {
                  if (widget.data.items[index].list != null) {
                    if (widget.data.items[index].list!.isNotEmpty) {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    }
                  }
                },
                child: Row(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      widget.data.items[index].key,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    if (widget.data.items[index].list != null)
                      if (widget.data.items[index].list!.isNotEmpty)
                        Icon(isExpanded
                            ? Icons.arrow_drop_up_rounded
                            : Icons.arrow_drop_down_rounded),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        widget.data.items[index].value,
                        style: widget.data.items[index].color != null
                            ? Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: widget.data.items[index].color)
                            : Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              if (isExpanded && widget.data.items[index].list != null)
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index2) => InnerReportItemCardView(
                        data: widget.data.items[index].list![index2]),
                    itemCount: widget.data.items[index].list!.length),
            ]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ]));
  }
}
