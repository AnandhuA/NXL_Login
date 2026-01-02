import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  AppSpacing._();

  // SIZEDBOX - HEIGHT
  static SizedBox h4() => SizedBox(height: 4.h);
  static SizedBox h8() => SizedBox(height: 8.h);
  static SizedBox h12() => SizedBox(height: 12.h);
  static SizedBox h16() => SizedBox(height: 16.h);
  static SizedBox h20() => SizedBox(height: 20.h);
  static SizedBox h24() => SizedBox(height: 24.h);
  static SizedBox h32() => SizedBox(height: 32.h);

  // SIZEDBOX - WIDTH
  static SizedBox w4() => SizedBox(width: 4.w);
  static SizedBox w8() => SizedBox(width: 8.w);
  static SizedBox w12() => SizedBox(width: 12.w);
  static SizedBox w16() => SizedBox(width: 16.w);
  static SizedBox w20() => SizedBox(width: 20.w);
  static SizedBox w24() => SizedBox(width: 24.w);
  static SizedBox w32() => SizedBox(width: 32.w);
}

class AppPadding {
  AppPadding._();

  // ALL SIDES
  static EdgeInsets p4() => EdgeInsets.all(4.w);
  static EdgeInsets p8() => EdgeInsets.all(8.w);
  static EdgeInsets p12() => EdgeInsets.all(12.w);
  static EdgeInsets p14() => EdgeInsets.all(14.w);
  static EdgeInsets p16() => EdgeInsets.all(16.w);
  static EdgeInsets p18() => EdgeInsets.all(18.w);
  static EdgeInsets p20() => EdgeInsets.all(20.w);
  static EdgeInsets p24() => EdgeInsets.all(24.w);
  static EdgeInsets p32() => EdgeInsets.all(32.w);

  // HORIZONTAL
  static EdgeInsets h8() => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets h12() => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets h14() => EdgeInsets.symmetric(horizontal: 14.w);
  static EdgeInsets h16() => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets h24() => EdgeInsets.symmetric(horizontal: 24.w);

  // VERTICAL
  static EdgeInsets v8() => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets v12() => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets v14() => EdgeInsets.symmetric(vertical: 14.h);
  static EdgeInsets v16() => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets v24() => EdgeInsets.symmetric(vertical: 24.h);
}

class AppRadius {
  AppRadius._();

  // RADIUS
  static Radius r8() => Radius.circular(8);
  static Radius r12() => Radius.circular(12);
  static Radius r16() => Radius.circular(16);
  static Radius r24() => Radius.circular(24);
  static Radius rFull() => Radius.circular(999);

  // BORDER RADIUS
  static BorderRadius br8() => BorderRadius.all(Radius.circular(8));
  static BorderRadius br12() => BorderRadius.all(Radius.circular(12));
  static BorderRadius br16() => BorderRadius.all(Radius.circular(16));
  static BorderRadius br24() => BorderRadius.all(Radius.circular(24));
  static BorderRadius brFull() => BorderRadius.all(Radius.circular(999));
}

class AppSizes {
  AppSizes._();

  // SIZES
  static double s4() => 4.w;
  static double s8() => 8.w;
  static double s12() => 12.w;
  static double s16() => 16.w;
  static double s20() => 20.w;
  static double s24() => 24.w;
  static double s32() => 32.w;
}
