import 'package:flutter/material.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/app/core/widgets/body_container.dart';
import 'package:inventory/app/pages/form/controller/form_controller.dart';
import 'package:inventory/app/pages/form/widgets/action_bar.dart';
import 'package:inventory/app/pages/form/widgets/count_field.dart';
import 'package:inventory/app/pages/form/widgets/name_field.dart';
import 'package:inventory/app/pages/form/widgets/save_button.dart';

class FormPage extends StatelessWidget {
  FormPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: actionBar,
      ),
      body: BodyContainer(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: AppDimens.defaultPadding * 4),
                const NameField(),
                const SizedBox(height: AppDimens.defaultPadding * 2),
                const CountField(),
                const SizedBox(height: AppDimens.defaultPadding * 4),
                SaveButton(
                  onPressed: () {
                    final currentState = _formKey.currentState;
                    if (currentState?.validate() == true) {
                      FormController.to.save();
                    }
                  },
                ),
                const SizedBox(height: AppDimens.defaultPadding * 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
