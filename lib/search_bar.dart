import 'package:flutter/material.dart';
import 'package:coffee_raja/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class SearchBarForCoffee extends StatefulWidget {
  const SearchBarForCoffee({super.key});

  @override
  State<SearchBarForCoffee> createState() => _SearchBarForCoffeeState();
}

class _SearchBarForCoffeeState extends State<SearchBarForCoffee> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorPalette.searchBarFill,
        ),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: 'Find Your Coffee ...',
              contentPadding: EdgeInsets.fromLTRB(10, 2, 5, 12),
              hintStyle: GoogleFonts.sourceSansPro(color: Color(0xFF525559)),
              border: InputBorder.none,
              fillColor: ColorPalette.searchBarFill,
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Iconify(
                  Zondicons.search,
                  color: Color(0xFF525559),
                ),
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, maxWidth: 40),
              prefixIconColor: Color(0xFF525559)),
          style: GoogleFonts.sourceSansPro(
            color: Color(0xFF525559),
          ),
        ),
      ),
    );
  }
}