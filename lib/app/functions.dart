import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:kiano/app/extension.dart';
import 'package:path_provider/path_provider.dart';
import '/domain/model/model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load(path);
//
//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//
//   return file;
// }

Future<DeviceInfo> getDeviceDetails() async {
  String name = "UnKnown";
  String identifier = "UnKnown";
  String version = "UnKnown";
  int deviceType = 0;

  // DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    // if (Platform.isAndroid) {
    //   final build = await deviceInfoPlugin.androidInfo;
    //   name = '${build.brand} ${build.model}';
    //   identifier = build.id ?? "";
    //   version = build.version.codename ?? "";
    //   deviceType = 1;
    // } else if (Platform.isIOS) {
    //   final build = await deviceInfoPlugin.iosInfo;
    //   deviceType = 2;
    //   name = '${build.name} ${build.model}';
    //   identifier = build.identifierForVendor ?? "";
    //   version = build.systemVersion ?? "";
    // }
  } on PlatformException {
    return DeviceInfo("name", "identifier", "version", 1);
  }
  return DeviceInfo("name", "identifier", "version", 1);
  return DeviceInfo(name, identifier, version, deviceType);
}

bool isEmailValid(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isPhoneNumberValid(String phoneNumber) {
  return RegExp(
      r"(0|\+98\0098)?([ ]|-|[()]){0,2}9[0|1|2|3|4]([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){8}")
      .hasMatch(phoneNumber);
}

String doubleFormatter(double number) =>
    NumberFormat.decimalPattern('en_US')
        .format(double.parse(number.toStringAsFixed(3)));

Future<File> getFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');
  final file = File('${(await getTemporaryDirectory()).path}/pdfFont.ttf');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  return file;
}

Future<void> createPdf(PdfModel item) async {
  final file = await getFileFromAssets('font/400iranyekanwebregularfanum.ttf');
  final font = PdfTrueTypeFont(file.readAsBytesSync(), 9);
  final fontTitle = PdfTrueTypeFont(file.readAsBytesSync(), 16);

  final centerStringFormat = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.middle,
    paragraphIndent: 0,
  );

  final rightStringFormat = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
    lineAlignment: PdfVerticalAlignment.middle,
    paragraphIndent: 1,
  );

  final leftStringFormat = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.left,
    lineAlignment: PdfVerticalAlignment.middle,
    paragraphIndent: 10,
  );

  final _pdfDocument = PdfDocument();
  final page = _pdfDocument.pages.add();
  _pdfDocument.pageSettings.margins.all = 16;
  final pageWith = _pdfDocument.pageSettings.width;
  page.graphics.drawRectangle(
      pen: PdfPens.black,
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(0, 0, (pageWith - 80), 100));

  page.graphics.drawString(
      item.leftText1 ?? '', font, format: rightStringFormat,
      brush: PdfBrushes.black, bounds: const Rect.fromLTWH(20, 30, 80, 0));

  page.graphics.drawString(
      item.leftText2 ?? '', font, format: rightStringFormat,
      brush: PdfBrushes.black, bounds: const Rect.fromLTWH(20, 45, 80, 0));

  page.graphics.drawString(
      item.leftText3 ?? '', font, format: rightStringFormat,
      brush: PdfBrushes.black, bounds: const Rect.fromLTWH(20, 60, 80, 0));

  page.graphics.drawString(
      item.title, fontTitle, format: centerStringFormat,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH((pageWith - 80) / 2, 20, 0, 0));

  page.graphics.drawString(
      item.subTitle ?? '', fontTitle, format: centerStringFormat,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH((pageWith - 80) / 2, 45, 0, 0));

  page.graphics.drawLine(PdfPens.black, Offset((pageWith - 80) / 2 - 60, 60),
      Offset((pageWith - 80) / 2 + 60, 60));
  page.graphics.drawLine(PdfPens.black, Offset((pageWith - 80) / 2 - 50, 65),
      Offset((pageWith - 80) / 2 + 50, 65));

  page.graphics.drawString(
      item.rightText1 ?? '', font, format: rightStringFormat,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH((pageWith - 100), 30, 0, 0));

  page.graphics.drawString(
      item.rightText2 ?? '', font, format: rightStringFormat,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH((pageWith - 100), 45, 0, 0));

  page.graphics.drawString(
      item.rightText3 ?? '', font, format: rightStringFormat,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH((pageWith - 100), 60, 0, 0));

  page.graphics.drawString(
      item.rightText4 ?? '', font, format: rightStringFormat,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH((pageWith - 100), 80, 0, 0));

  PdfGrid grid = PdfGrid();
  grid.style = PdfGridStyle(font: font);

  grid.columns.add(count: item.headers.length + 1);

  for (int i = 0; i <= item.headers.length; i++) {
    grid.columns[i].format = centerStringFormat;
    grid.columns[i].width = (pageWith - 80) / 100 * item.columnsWidth[i];
  }

  grid.headers.add(1);
  PdfGridRow header = grid.headers[0];
  final values = item.headers.entries.map((e) => e.value).toList();
  for (int i = 0; i < values.length; i++) {
    header.cells[values.length - 1 - i].value = values[i];
    header.cells[values.length - 1 - i].stringFormat = centerStringFormat;
  }
  header.cells[values.length].value = 'ردیف';
  header.cells[values.length].stringFormat = rightStringFormat;

  PdfGridRowStyle rowStyle = PdfGridRowStyle(
      backgroundBrush: PdfBrushes.lightGoldenrodYellow, font: font);
  header.style = rowStyle;

  final List<String> keys = item.headers.entries.map((e) => e.key).toList();

  PdfGridRow row;
  for (int i = 1; i < item.data.length; i++) {
    row = grid.rows.add();
    row.cells[values.length].value = '$i';
    final Map<String, dynamic> element = item.data[i];
    for (int j = 0; j < item.headers.length; j++) {
      row.cells[values.length - 1 - j].value = (element[keys[j]]).toString();
    }
  }

  PdfLayoutResult result = grid.draw(page: page,
      bounds: Rect.fromLTWH(0, 105, 0,
          _pdfDocument.pageSettings.height - 100)) as PdfLayoutResult;

  PdfGrid bottomRow = PdfGrid();
  bottomRow.style = PdfGridStyle(font: font);
  bottomRow.columns.add(count: item.bottomRow.length);

  final bottomRowKeys = item.bottomRow.entries.map((e) => e.key).toList();
  for (int i = 0; i < item.bottomRow.length; i++) {
    bottomRow.columns[i].format = centerStringFormat;
    bottomRow.columns[i].width =
        (pageWith - 80) / 100 * (item.bottomRow[bottomRowKeys[i]] as int);
  }

  row = bottomRow.rows.add();
  for (int i = 0; i < item.bottomRow.length; i++) {
    row.cells[i].value = bottomRowKeys[i];
  }

  row.cells[item.bottomRow.length - 1].stringFormat = leftStringFormat;

  result = bottomRow.draw(page: result.page,
      bounds: Rect.fromLTWH(0, result.bounds.bottom, 0,
          _pdfDocument.pageSettings.height - 100)) as PdfLayoutResult;

  result.page.graphics.drawString(
      'نرم افزار حسابداری کیاسیستم: 05137136120', font,
      format: rightStringFormat,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH((pageWith - 80), result.bounds.bottom + 15, 0, 0));

  //Create the footer with specific bounds
  PdfPageTemplateElement footer = PdfPageTemplateElement(
      Rect.fromLTWH(0, 0, _pdfDocument.pageSettings.size.width, 100));

  //Create the page number field
  PdfPageNumberField pageNumber =
  PdfPageNumberField(font: font, brush: PdfSolidBrush(PdfColor(0, 0, 0)));
  pageNumber.numberStyle = PdfNumberStyle.numeric;

  //Create the page count field
  PdfPageCountField pageCount =
  PdfPageCountField(font: font, brush: PdfSolidBrush(PdfColor(0, 0, 0)));
  pageCount.numberStyle = PdfNumberStyle.numeric;

  //Create the composite field with page number page count
  PdfCompositeField compositeField = PdfCompositeField(
      font: font,
      text: 'صفحه {0} از {1}',
      fields: <PdfAutomaticField>[pageNumber, pageCount]);
  compositeField.bounds = footer.bounds;
  compositeField.stringFormat = centerStringFormat;
  //Add the composite field in footer
  compositeField.draw(footer.graphics, Offset(-30, 50 - font.height));

  //Add the footer at the bottom of the document
  _pdfDocument.template.bottom = footer;

  List<int> bytes = await _pdfDocument.save();
  _pdfDocument.dispose();

  saveAndLaunchFile(bytes, 'out2Put.pdf');
}

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final path = (await getExternalStorageDirectory())?.path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  // OpenFile.open('$path/$fileName');
  await Share.shareFiles([file.path]);
}