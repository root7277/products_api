import 'package:provider_state_managnment/resours/shorts.dart';

abstract class AppStyles {
  static TextStyle getAppBarStyles() => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: AppColors.appBarColor,
      );
  static TextStyle getCategoryStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.appBarColor,
      );
}
