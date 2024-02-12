import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kiano/presentation/resources/assets_manager.dart';
import '../../base/base_view.dart';
import '/presentation/screens/register/register_view_model.dart';
import '/app/di.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/resources/string_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _viewModel = instance<RegisterViewModel>();
  final _phoneNumberController = TextEditingController();

  _bind() {
    _viewModel.start();
    _phoneNumberController.addListener(
        () => _viewModel.setPhoneNumber(_phoneNumberController.text));

    _viewModel.nextStreamOutput.listen((isSuccess) {
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _dismissDialog(context);
        Navigator.of(context).pushNamed(Routes.verificationRoute,
            arguments: _phoneNumberController.text);
      });
    });
  }

  _dismissDialog(BuildContext context) {
    if(_viewModel.currentFlowState != null){
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: _viewModel,
      child: _getContentWidget()
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              const SizedBox(
                height: AppSize.s32,
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
                // AppString.register.tr(),
                "ورود",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Text(
                // AppString.registerDescription.tr(),
                "شماره تلفن را وارد کنید",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Container(
                padding: const EdgeInsets.all(AppSize.s28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: Column(
                  children: [
                    StreamBuilder<bool>(
                      stream: _viewModel.isPhoneNumberValidOutput,
                      builder: (context, snapshot) => TextFormField(
                        textDirection: ui.TextDirection.ltr,
                        keyboardType: TextInputType.phone,
                        controller: _phoneNumberController,
                        style: Theme.of(context).textTheme.headline6,
                        decoration: InputDecoration(
                          hintText: "09123456789",
                          labelText: "شماره",
                          // AppString.phoneNumber.tr(),
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "شماره اشتباه است",
                          // AppString.incorrectPhoneNumber.tr(),
                          // suffix: Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: AppPadding.p8),
                          //   child: Text(
                          //     // AppString.irCountryCode.tr(),
                          //     "98+",
                          //     style: Theme.of(context).textTheme.headline6,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<bool>(
                        stream: _viewModel.isPhoneNumberValidOutput,
                        builder: (context, snapshot) => ElevatedButton(
                          onPressed: snapshot.data ?? false
                              ? () => _viewModel.register()
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p14),
                            child: Text(
                              AppString.ok.tr(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
