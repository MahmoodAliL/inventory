import 'package:intl/intl.dart';

extension DoubleX on double {
  String toStringDefaultFormat() {
    return NumberFormat.decimalPattern('en').format(this);
  }
}
