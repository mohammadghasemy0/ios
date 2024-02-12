import 'dart:async';
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kiano/presentation/resources/assets_manager.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/presentation/screens/verification/verification_view_model.dart';
import '/app/di.dart';
import '../../resources/routes_manager.dart';
import '/presentation/resources/string_manager.dart';
import '/presentation/resources/values_manager.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({Key? key, required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final _viewModel = instance<VerificationViewModel>();
  final _codeController1 = TextEditingController();
  final _codeController2 = TextEditingController();
  final _codeController3 = TextEditingController();
  final _codeController4 = TextEditingController();

  // final _codeController5 = TextEditingController();

  _bind() {
    _viewModel.start();
    _codeController1.addListener(() => _viewModel.setVerification(_getCode()));
    _codeController2.addListener(() => _viewModel.setVerification(_getCode()));
    _codeController3.addListener(() => _viewModel.setVerification(_getCode()));
    _codeController4.addListener(() => _viewModel.setVerification(_getCode()));
    // _codeController5.addListener(() => _viewModel.setVerification(_getCode()));

    _viewModel.nextOutput.listen((isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).restorablePushNamedAndRemoveUntil(
            Routes.homeRoute, (route) => false);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _codeController1.dispose();
    _codeController2.dispose();
    _codeController3.dispose();
    _codeController4.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<FlowState?>(
          stream: _viewModel.outputState,
          builder: (_, snapshot) {
            if (_viewModel.flowState != null) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _viewModel.dismissDialog(context);
                Future.delayed(const Duration(milliseconds: 2), () {
                  _viewModel.showDialogScreen(context, _viewModel.flowState!);
                  _viewModel.currentFlowState = _viewModel.flowState;
                  _viewModel.flowState = null;
                },);
              });
            }
            return _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p24, horizontal: AppPadding.p16),
          child: Column(
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.pop(context);
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: AppSize.s32,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "اعتبارسنجی",
                          style: Theme.of(context).textTheme.headline6,
                        )))
              ]),
              const SizedBox(
                height: AppSize.s18,
              ),
              Container(
                width: AppSize.s200,
                height: AppSize.s200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(ImageAssets.logo),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Text(
                // AppString.verificationDescription.tr(),
                "کد اعتبارسنجی ارسال شده را وارد کنید",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // AppString.verification.tr(),
                    widget.phoneNumber,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      // AppString.verification.tr(),
                      "ویرایش",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Container(
                padding: const EdgeInsets.all(AppPadding.p2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r12),
                ),
                child: Column(
                  children: [
                    Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(
                              first: true,
                              last: false,
                              controller: _codeController1),
                          _textFieldOTP(
                              first: false,
                              last: false,
                              controller: _codeController2),
                          _textFieldOTP(
                              first: false,
                              last: false,
                              controller: _codeController3),
                          _textFieldOTP(
                              first: false,
                              last: true,
                              controller: _codeController4),
                          // _textFieldOTP(
                          //     first: false,
                          //     last: true,
                          //     controller: _codeController5),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<bool>(
                        stream: _viewModel.isValidCodeOutput,
                        builder: (context, snapshot) => ElevatedButton(
                          onPressed: snapshot.data ?? false ? onPressBtn : null,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p14),
                            child: Text(
                              AppString.ok.tr(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              _viewModel.isTimeOut
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // AppString.codeNotReceived.tr(),
                          "کد ارسال نشد؟ ",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () => WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Navigator.pop(context);
                          }),
                          child: Text(
                            // AppString.resendNewCode.tr(),
                            "ارسال مجدد",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : TimerWidget(
                      time: const Duration(seconds: 120),
                      onTimeOut: _viewModel.onTimeOut),
            ],
          ),
        ),
      ),
    );
  }

  String _getCode() {
    final res = _codeController1.text +
        _codeController2.text +
        _codeController3.text +
        _codeController4.text;
    // _codeController5.text;
    return res;
  }

  Widget _textFieldOTP(
      {required bool first,
      required bool last,
      TextEditingController? controller}) {
    return Container(
      width: AppSize.s70,
      height: AppSize.s70,
      padding: const EdgeInsets.all(AppPadding.p2),
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.isNotEmpty && !last) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
        controller: controller,
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: AppSize.s2,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(AppOpacity.o12)),
              borderRadius: BorderRadius.circular(AppSize.s12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: AppSize.s2,
                  color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(AppSize.s12)),
        ),
      ),
    );
  }

  onPressBtn() {
    FocusScope.of(context).unfocus();
    _viewModel.verification();
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key, required this.time, required this.onTimeOut})
      : super(key: key);
  final Duration time;
  final Function() onTimeOut;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration time = const Duration(minutes: 2);
  Timer? timer;

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    time = widget.time;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.inSeconds < 2) {
        timer.cancel();
        widget.onTimeOut();
      }
      setState(() {
        time = Duration(seconds: time.inSeconds - 1);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${(time.inMinutes.remainder(60).toString().padLeft(2, '0'))}:${time.inSeconds.remainder(60).toString().padLeft(2, '0')}",
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
