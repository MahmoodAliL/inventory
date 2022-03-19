class FormFiledValidator {
  static String? required(String? value, {String? errorText}) {
    if (value == null || value.trim().isEmpty) {
      return errorText ?? 'This field is required';
    }
    return null;
  }
}
