import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../domain/model/model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import 'base_card_view.dart';

class ChartItemCardView extends StatelessWidget {
  ChartItemCardView({Key? key, required this.data}) : super(key: key);
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final ChartItemData data;

  @override
  Widget build(BuildContext context) {
    return CardView(
      title: data.title,
      iconName: ImageAssets.clChart2,
      child: SfCircularChart(
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
              textStyle: Theme.of(context).textTheme.caption,
              alignment: ChartAlignment.far),
          series: <CircularSeries>[
            DoughnutSeries<ChartItemDataField, String>(
              dataSource: data.chartItemDataList,
              xValueMapper: (ChartItemDataField data, _) => data.key,
              yValueMapper: (ChartItemDataField data, _) => data.value,
              dataLabelMapper: (ChartItemDataField data, _) =>
              data.value.toString(),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                showCumulativeValues: true,
                labelPosition: ChartDataLabelPosition.outside,
                textStyle:
                TextStyle(fontFamily: FontConstants.yekanFarsiFontFamily),
              ),
            ),
          ]),
    );
  }
}