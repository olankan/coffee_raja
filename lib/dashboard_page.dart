// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:coffee_raja/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:coffee_raja/search_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> coffeeTypes = [
    'Cappuccino',
    'Expresso',
    'Latte',
    'Flat White'
  ];

  String SelectedItem = 'Cappuccino';
  int counter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0F14),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: Color(0xff1f242C),
                          borderRadius: BorderRadius.circular(12),
                          // ignore: prefer_const_constructors
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: const Iconify(
                            Zondicons.view_tile,
                            color: Color(0xFF4D4F52),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          // ignore: prefer_const_constructors
                          image: DecorationImage(
                              image: AssetImage('images/model.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12),
                          // ignore: prefer_const_constructors
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: (MediaQuery.of(context).size.width / 3) * 2 + 25,
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            // THE SEARCH BAR
            SearchBarForCoffee(),
            SizedBox(height: 20),
            // THE COFFEE LIST TAB
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                          begin: Alignment(0.7, -1.0),
                          end: Alignment(1.0, -1.0),
                          colors: <Color>[Colors.black, Colors.transparent])
                      .createShader(bounds);
                },
                blendMode: BlendMode.dstATop,
                child: Container(
                  color: Color(0xFF0D0F14),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...coffeeTypes.map((e) {
                        counter++;
                        if (counter <= 3)
                          return _buildTypes(e, counter);
                        else {
                          counter = 0;
                          return _buildTypes(e, counter);
                        }
                      }).toList()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypes(coffee, counter) {
    return Padding(
      padding:
          counter != 0 ? EdgeInsets.only(left: 25) : EdgeInsets.only(left: 7),
      child: Container(
        height: 50,
        color: Color(0xFF0D0F14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  SelectedItem = coffee;
                });
              },
              child: Text(
                coffee,
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: coffee == SelectedItem
                        ? ColorPalette.coffeeSelected
                        : ColorPalette.coffeeUnselected,
                    fontSize: 17),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: coffee == SelectedItem
                      ? ColorPalette.coffeeSelected
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
