import '../../../../app/functions.dart';
import '../../../../domain/model/model.dart';
import '/presentation/screens/module/base_module_view_model.dart';
import '/domain/usecase/finance/finance_bed_bes_rep_usecase.dart';
import '../../filter_screen/filter_model/base_filter_model.dart';
import '../../filter_screen/filter_model/financial/bed_bes.dart';
import '/data/mapper/mapper.dart';
import '/presentation/screens/reporter/base_reporter_view_model.dart';

class FinancialBedBesViewModel extends ReportsViewModel
    with MaterialBillRepViewModelInput, MaterialBillRepViewModelOutput {
  final FinanceBedBesRepUseCase _useCase;
  FinancialBedBesRep? data;
  FinancialBedBesFilterModel bedBesFilterModel = FinancialBedBesFilterModel("بدهکار بستانکار");

  FinancialBedBesViewModel(this._useCase);

  @override
  void start() async {
    getData();
  }

  @override
  getData() async {
    header = null;
    reportItemData = [];
    refreshDataInput.add(RefreshState.loading);
    (await _useCase.execute(bedBesFilterModel.getRequest()))
        .fold((l) => refreshDataInput.add(RefreshState.error), (r) {
          if(r!= null){
            reportItemData = r.toReportItemData();
            data = r;
          }
      refreshDataInput.add(RefreshState.hasData);
    });
  }

  @override
  FilterModel get filterModel => bedBesFilterModel;

  @override
  set filterModel(filterModel) {
    bedBesFilterModel = filterModel;
  }

  @override
  bool hasPdf() {
    return true;
  }

  @override
  getPdf(){
    final req = bedBesFilterModel.getRequest();
    final item = PdfModel(
      title: bedBesFilterModel
          .cacheParams.currentCompany?.customerName ??
          '',
      leftText2: 'ار تاریخ: ${req.persianFromStrDate}',
      leftText3: 'تا تاریخ: ${req.persianToStrDate}',
      subTitle: 'گزارش بدهکار و بستانکار',

      headers: {
        "codeHesab": "کد حساب",
        "hesabName": "نام حساب",
        "bed": "بدهکار",
        "bes": "بستانکار",
        "mandehBed": "مانده بدهکار",
        "mandehBes": " بمانده بستانکار",
      },
      data: data!.details
          .map((e) => {
        "codeHesab": e.codHesab,
        "hesabName": e.nameHesab,
        "bed": e.mabBedStr,
        "bes": e.mabBesStr,
        "mandehBed": e.mandeBedStr,
        "mandehBes": e.mandeBesStr,
      })
          .toList(),
      columnsWidth: [17, 17, 17, 17, 17, 10, 5],
      bottomRow: {
        data!.totalMandeBedStr: 17,
        data!.totalMandeBesStr: 17,
        "جمع کل:   ": 66,
      },
    );
    createPdf(item);
  }

  @override
  List<int> get shimmerCardRowCount => [4,4,4,4,4,4];
}

abstract class MaterialBillRepViewModelInput {}

abstract class MaterialBillRepViewModelOutput {}
