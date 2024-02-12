import 'package:flutter/material.dart';
import 'package:kiano/presentation/resources/assets_manager.dart';

enum StateRendererType { modal, popup, fullScreen }

abstract class FlowState {
  final String? message;
  final String? image;
  late final Key key;
  final StateRendererType stateRendererType;

  FlowState(this.message, this.image, this.stateRendererType) {
    key = UniqueKey();
  }

  StateRendererType get renderType;

  Widget getScreenWidget(BuildContext context);
}

class ErrorState extends FlowState {
  final Function()? onTap;
  final String? btnTitle;

  ErrorState(
      {this.onTap,
      StateRendererType stateRendererType = StateRendererType.popup,
      this.btnTitle,
      String? message,
      String? image})
      : super(message, image, stateRendererType);

  @override
  Widget getScreenWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message ?? "خطا", textAlign: TextAlign.center),
        const SizedBox(height: 16),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              if (onTap != null) {
                onTap!.call();
              }
            },
            child: const SizedBox(
                width: double.maxFinite,
                child: Text(
                  "تائید",
                  textAlign: TextAlign.center,
                )))
      ],
    );
  }

  @override
  StateRendererType get renderType => stateRendererType;
}

class SuccessState extends FlowState {

  SuccessState(
      {
      StateRendererType stateRendererType = StateRendererType.popup,
      String? message,
      String? image})
      : super(message, image, stateRendererType);

  @override
  Widget getScreenWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message ?? "عملیات با موفقیت ثبت شد.", textAlign: TextAlign.center),
        const SizedBox(height: 16),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const SizedBox(
                width: double.maxFinite,
                child: Text(
                  "تائید",
                  textAlign: TextAlign.center,
                )))
      ],
    );
  }

  @override
  StateRendererType get renderType => stateRendererType;
}

class LoadingState extends FlowState {
  LoadingState(
      {StateRendererType stateRendererType = StateRendererType.popup,
      String? message,
      String? image})
      : super(message, image, stateRendererType);

  @override
  Widget getScreenWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        CircularProgressIndicator(),
      ],
    );
  }

  @override
  StateRendererType get renderType => StateRendererType.popup;
}

class QuestionState extends FlowState {
  final Function()? onAccept;
  final Function()? onCancel;

  QuestionState(
      {this.onAccept,
      this.onCancel,
      StateRendererType stateRendererType = StateRendererType.popup,
      required String message,
      String? image})
      : super(message, image, stateRendererType);

  @override
  Widget getScreenWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(image != null)
        Image.asset(image!, width: 48,height: 48,),
        Text(message!, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    if (onCancel!= null) {
                      onCancel!.call();
                    }
                  },
                  child: const Text(
                    "انصراف",
                    textAlign: TextAlign.center,
                  )),
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  if (onAccept != null) {
                    onAccept!.call();
                  }
                },
                child: const Text(
                  "تائید",
                  textAlign: TextAlign.center,
                )),
            ],
        )
      ],
    );
  }

  @override
  StateRendererType get renderType => StateRendererType.popup;
}
