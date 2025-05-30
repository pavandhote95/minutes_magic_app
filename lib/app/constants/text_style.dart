import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

class KTextStyle {
  static nunito({
    required double fs,
    required Color c,
    required FontWeight fw,
    TextDecoration? decoration,
  }) => GoogleFonts.nunito(
    fontWeight: fw,
    fontSize: fs,
    color: c,
    fontStyle: FontStyle.normal,
    decoration: decoration,
  );

  static montserrat({
    required double fs,
    required Color c,
    required FontWeight fw,
    TextDecoration? decoration,
  }) => GoogleFonts.montserrat(
    fontWeight: fw,
    fontSize: fs,
    color: c,
    fontStyle: FontStyle.normal,
    decoration: decoration,
  );
  static inter({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.inter(fontWeight: fw, fontSize: fs, color: c);
  static barlow({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.barlow(fontWeight: fw, fontSize: fs, color: c);

  static poppins({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.poppins(fontWeight: fw, fontSize: fs, color: c);

  static lato({required double fs, required Color c, required FontWeight fw}) =>
      GoogleFonts.lato(fontWeight: fw, fontSize: fs, color: c);

  static aclonica({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.aclonica(fontWeight: fw, fontSize: fs, color: c);
}
