import 'package:flutter_api_rest/shared/theme/colors.dart';
import 'package:flutter_api_rest/shared/theme/text_styles.dart';

abstract class AppTheme {
  AppTheme();
  static AppColors get colors => AppColorsDefault();
  static AppTextStyles get textStyles => AppTextStylesDefault();
}
