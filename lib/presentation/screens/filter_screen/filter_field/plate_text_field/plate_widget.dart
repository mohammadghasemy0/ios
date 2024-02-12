import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/domain/model/model.dart';
import '../../../../resources/assets_manager.dart';

class PlateWidget extends StatefulWidget {
  const PlateWidget({
    Key? key,
    required this.onChange,
    required this.plate,
  }) : super(key: key);
  final CarPlate plate;
  final Function(CarPlate plate) onChange;

  @override
  State<PlateWidget> createState() => _PlateWidgetState();
}

class _PlateWidgetState extends State<PlateWidget> {
  final TextEditingController p1Controller = TextEditingController();
  final TextEditingController p2Controller = TextEditingController();
  final TextEditingController p3Controller = TextEditingController();
  final TextEditingController p4Controller = TextEditingController();
  late CarPlate plate;
  late Function(CarPlate plate) onChange;

  @override
  void initState() {
    plate = widget.plate;
    onChange = widget.onChange;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    p1Controller.text = plate.p1 > 0 ? "${plate.p1}" : "";
    p2Controller.text = plate.p2;
    p3Controller.text = plate.p3 > 0 ? "${plate.p3}" : "";
    p4Controller.text = plate.p4 > 0 ? "${plate.p4}" : "";

    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Image.asset(ImageAssets.plate, fit: BoxFit.contain),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 85,
                child: TextField(
                    controller: p4Controller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 2,
                    enableInteractiveSelection: false,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 20),
                    ),
                    onTap: () {
                      p4Controller.selection = TextSelection.collapsed(
                          offset: p4Controller.text.length);
                    },
                    onChanged: (text) {
                      plate.p4 = text != "" ? int.parse(text) : 0;
                      widget.onChange(plate);
                      // if (text.isEmpty) {
                      //   FocusScope.of(context).unfocus();
                      // } else if (text.length > 1) {
                      //   FocusScope.of(context).nextFocus();
                      // }
                    }),
              ),
              Expanded(
                flex: 90,
                child: TextField(
                    controller: p3Controller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 3,
                    enableInteractiveSelection: false,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onTap: () {
                      p3Controller.selection = TextSelection.collapsed(
                          offset: p3Controller.text.length);
                    },
                    onChanged: (text) {
                      plate.p3 = text != "" ? int.parse(text) : 0;
                      widget.onChange(plate);
                      // if (text.isEmpty) {
                      //   FocusScope.of(context).previousFocus();
                      // } else if (text.length > 2) {
                      //   FocusScope.of(context).nextFocus();
                      // }
                    }),
              ),
              Expanded(
                flex: 75,
                child: TextField(
                    controller: p2Controller,
                    textAlign: TextAlign.center,
                    // readOnly: true,
                    maxLength: 3,
                    enableInteractiveSelection: false,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      counterText: "",
                    ),
                    onTap: () {
                      p2Controller.selection = TextSelection.collapsed(
                          offset: p2Controller.text.length);
                    },
                    onChanged: (text) {
                      plate.p2 = text;
                      widget.onChange(plate);
                      // if (text.isEmpty) {
                      //   FocusScope.of(context).previousFocus();
                      // } else if (text.length > 2) {
                      //   FocusScope.of(context).nextFocus();
                      // }
                    }),
              ),
              Expanded(
                flex: 65,
                child: TextField(
                    controller: p1Controller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 2,
                    enableInteractiveSelection: false,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onTap: () {
                      p1Controller.selection = TextSelection.collapsed(
                          offset: p1Controller.text.length);
                    },
                    onChanged: (text) {
                      plate.p1 = text != "" ? int.parse(text) : 0;
                      widget.onChange(plate);
                      // if (text.isEmpty) {
                      //   FocusScope.of(context).previousFocus();
                      // } else if (text.length > 1) {
                      //   FocusScope.of(context).unfocus();
                      // }
                    }),
              ),
              const Expanded(flex: 35,child: SizedBox())
            ],
          ),
        )
      ],
    );
  }
}

// Positioned(
// left: 36,
// top: 4,
// child: SizedBox(
// width: 65,
// child: TextField(
// controller: p1Controller,
// textAlign: TextAlign.center,
// keyboardType: TextInputType.number,
// inputFormatters: <TextInputFormatter>[
// FilteringTextInputFormatter.digitsOnly
// ],
// maxLength: 2,
// enableInteractiveSelection: false,
// style: const TextStyle(
// fontSize: 40,
// fontWeight: FontWeight.bold,
// color: Colors.black87),
// decoration: const InputDecoration(
// counterText: "",
// border: InputBorder.none,
// disabledBorder: InputBorder.none,
// enabledBorder: InputBorder.none,
// contentPadding:
// EdgeInsets.symmetric(vertical: 8, horizontal: 0),
// ),
// onTap: () {
// p1Controller.selection = TextSelection.collapsed(
// offset: p1Controller.text.length);
// },
// onChanged: (text) {
// plate.p1 = text != "" ? int.parse(text) : 0;
// widget.onChange(plate);
// // if (text.length > 1) {
// //   FocusScope.of(context).nextFocus();
// // }
// }),
// )),
// Positioned(
// left: 101,
// top: 4,
// child: SizedBox(
// width: 80,
// child: TextField(
// controller: p2Controller,
// textAlign: TextAlign.center,
// // readOnly: true,
// maxLength: 3,
// enableInteractiveSelection: false,
// style: const TextStyle(
// fontSize: 40,
// fontWeight: FontWeight.bold,
// color: Colors.black87),
// decoration: const InputDecoration(
// border: InputBorder.none,
// disabledBorder: InputBorder.none,
// enabledBorder: InputBorder.none,
// contentPadding:
// EdgeInsets.symmetric(vertical: 8, horizontal: 0),
// ),
// onTap: () {
// p2Controller.selection = TextSelection.collapsed(
// offset: p2Controller.text.length);
// },
// onChanged: (text) {
// plate.p2 = text;
// widget.onChange(plate);
// // if (text.isEmpty) {
// //   FocusScope.of(context).previousFocus();
// // } else if (text.length > 2) {
// //   FocusScope.of(context).unfocus();
// // }
// }),
// )),
// Positioned(
// left: 181,
// top: 4,
// child: SizedBox(
// width: 95,
// child: TextField(
// controller: p3Controller,
// textAlign: TextAlign.center,
// keyboardType: TextInputType.number,
// inputFormatters: <TextInputFormatter>[
// FilteringTextInputFormatter.digitsOnly
// ],
// maxLength: 3,
// enableInteractiveSelection: false,
// style: const TextStyle(
// fontSize: 40,
// fontWeight: FontWeight.bold,
// color: Colors.black87),
// decoration: const InputDecoration(
// counterText: "",
// border: InputBorder.none,
// disabledBorder: InputBorder.none,
// enabledBorder: InputBorder.none,
// contentPadding:
// EdgeInsets.symmetric(vertical: 8, horizontal: 0),
// ),
// onTap: () {
// p3Controller.selection = TextSelection.collapsed(
// offset: p3Controller.text.length);
// },
// onChanged: (text) {
// plate.p3 = text != "" ? int.parse(text) : 0;
// widget.onChange(plate);
// // if (text.isEmpty) {
// //   FocusScope.of(context).previousFocus();
// // } else if (text.length > 2) {
// //   FocusScope.of(context).nextFocus();
// // }
// }),
// )),
// Positioned(
// left: 276,
// top: 4,
// child: SizedBox(
// width: 80,
// child: TextField(
// controller: p4Controller,
// textAlign: TextAlign.center,
// keyboardType: TextInputType.number,
// inputFormatters: <TextInputFormatter>[
// FilteringTextInputFormatter.digitsOnly
// ],
// maxLength: 2,
// enableInteractiveSelection: false,
// style: const TextStyle(
// fontSize: 36,
// fontWeight: FontWeight.bold,
// color: Colors.black87),
// decoration: const InputDecoration(
// counterText: "",
// border: InputBorder.none,
// disabledBorder: InputBorder.none,
// enabledBorder: InputBorder.none,
// contentPadding: EdgeInsets.only(top: 20),
// ),
// onTap: () {
// p4Controller.selection = TextSelection.collapsed(
// offset: p4Controller.text.length);
// },
// onChanged: (text) {
// plate.p4 = text != "" ? int.parse(text) : 0;
// widget.onChange(plate);
// // if (text.isEmpty) {
// //   FocusScope.of(context).previousFocus();
// // } else if (text.length > 1) {
// //   FocusScope.of(context).nextFocus();
// // }
// }),
// )),
