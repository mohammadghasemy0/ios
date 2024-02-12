import 'package:kiano/app/extension.dart';

import '/app/functions.dart';
import '/domain/model/model.dart';
import '/data/mapper/mapper.dart';
import '/presentation/screens/filter_screen/filter_model/financial/gozaresh_hesab.dart';
import '/domain/usecase/finance/finance_gozaresh_hesab_rep_usecase.dart';
import '/presentation/screens/module/base_module_view_model.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class FinancialGozareshHesabViewModel extends ReportsViewModel
    with MaterialBillRepViewModelInput, MaterialBillRepViewModelOutput {
  final FinanceGozareshHesabUseCase _useCase;
  List<FinancialGozareshHesabRep> data = [];
  FinancialGozareshHesabFilterModel gozareshHesabRepFilterModel =
      FinancialGozareshHesabFilterModel("گزارش حساب");

  FinancialGozareshHesabViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];
    refreshDataInput.add(RefreshState.loading);
    if (gozareshHesabRepFilterModel.getRequest().hesabTafsili != 0) {
      (await _useCase.execute(gozareshHesabRepFilterModel.getRequest()))
          .fold((l) => refreshDataInput.add(RefreshState.error), (r) {
        if (r != null) {
          reportItemData = r.toReportItemDataList();
          data.clear();
          data.addAll(r);
        }
        refreshDataInput.add(RefreshState.hasData);
      });
    } else {
      refreshDataInput.add(RefreshState.hasData);
    }
  }

  @override
  FilterModel get filterModel => gozareshHesabRepFilterModel;

  @override
  set filterModel(filterModel) {
    gozareshHesabRepFilterModel = filterModel;
  }

  @override
  List<int> get shimmerCardRowCount => [16, 16];


  @override
  bool hasPdf() {
    return true;
  }

  @override
  void getPdf() {
    final req = gozareshHesabRepFilterModel.getRequest();
    print("///////////////////    ${req.hesabTafsili}");
    final item = PdfModel(
      title: gozareshHesabRepFilterModel
              .cacheParams.currentCompany?.customerName ??
          '',
      subTitle: 'گزارش حساب',
      leftText2: 'ار تاریخ: ${req.persianFromStrDate}',
      leftText3: 'تا تاریخ: ${req.persianToStrDate}',
      rightText3: 'کد حساب: ${req.hesabTafsili}',
      rightText4:
          'نام حساب: ${gozareshHesabRepFilterModel.cacheParams.tafsili.where((element) => element.idTafsili == req.hesabTafsili).first.nameTafsili}',
      headers: {
        "date": "تاریخ",
        "shBarge": "شماره سند",
        "description": "شرح",
        "bed": "بدهکار",
        "bes": "بستانکار",
        "mandeh": "مانده",
        "tashkhis": "تش"
      },
      data: data
          .map((e) => {
                "date": e.date,
                "shBarge": e.shBarge,
                "description": e.description,
                "bed": e.bed,
                "bes": e.bes,
                "mandeh": e.mandeh,
                "tashkhis": e.tashkhis,
              })
          .toList(),
      columnsWidth: [4, 12, 12, 12, 36, 9, 10, 5],
      bottomRow: {
        data.first.tashkhis: 4,
        data.last.mandeh: 12,
        " ": 12,
        "": 12,
        "جمع کل:   ": 60,
      },
    );
    createPdf(item);
  }
}

abstract class MaterialBillRepViewModelInput {}

abstract class MaterialBillRepViewModelOutput {}
