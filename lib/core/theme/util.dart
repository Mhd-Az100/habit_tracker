import 'package:flutter/material.dart';

TextTheme createTextTheme(BuildContext context, {required String bodyFontFamily,required String displayFontFamily}) {
  final base = Theme.of(context).textTheme;

  return base.copyWith(
    displayLarge: base.displayLarge?.copyWith(fontFamily: displayFontFamily),
    displayMedium: base.displayMedium?.copyWith(fontFamily: displayFontFamily),
    displaySmall: base.displaySmall?.copyWith(fontFamily: displayFontFamily),
    headlineLarge: base.headlineLarge?.copyWith(fontFamily: displayFontFamily),
    headlineMedium: base.headlineMedium?.copyWith(fontFamily: displayFontFamily),
    headlineSmall: base.headlineSmall?.copyWith(fontFamily: displayFontFamily),
    titleLarge: base.titleLarge?.copyWith(fontFamily: displayFontFamily),
    titleMedium: base.titleMedium?.copyWith(fontFamily: displayFontFamily),
    titleSmall: base.titleSmall?.copyWith(fontFamily: displayFontFamily),
    //
    bodyLarge: base.bodyLarge?.copyWith(fontFamily: bodyFontFamily),
    bodyMedium: base.bodyMedium?.copyWith(fontFamily: bodyFontFamily),
    bodySmall: base.bodySmall?.copyWith(fontFamily: bodyFontFamily),
    labelLarge: base.labelLarge?.copyWith(fontFamily: bodyFontFamily),
    labelMedium: base.labelMedium?.copyWith(fontFamily: bodyFontFamily),
    labelSmall: base.labelSmall?.copyWith(fontFamily: bodyFontFamily),
  );
}
