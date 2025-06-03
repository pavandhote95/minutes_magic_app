import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  const CustomButton(


      {

    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: width,
      height: height,
      child: ElevatedButton(

        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 161, 157, 252),
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),

        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}
