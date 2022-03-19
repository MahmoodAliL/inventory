import 'package:flutter/material.dart';
import 'package:inventory/app/core/value/dimens.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.defaultPadding * 2,
      ),
      child: child,
    );
  }
}
