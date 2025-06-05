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

  static lato({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.lato(fontWeight: fw, fontSize: fs, color: c);

  static aclonica({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.aclonica(fontWeight: fw, fontSize: fs, color: c);

  static roboto({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.roboto(fontWeight: fw, fontSize: fs, color: c);

  static ubuntu({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.ubuntu(fontWeight: fw, fontSize: fs, color: c);

  static openSans({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.openSans(fontWeight: fw, fontSize: fs, color: c);

  static cabin({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.cabin(fontWeight: fw, fontSize: fs, color: c);

  static rajdhani({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.rajdhani(fontWeight: fw, fontSize: fs, color: c);

  static alata({
    required double fs,
    required Color c,
    required FontWeight fw,
  }) => GoogleFonts.alata(fontWeight: fw, fontSize: fs, color: c);
}
