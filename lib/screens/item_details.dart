import 'package:coffee_raja/color_palette.dart';
import 'package:coffee_raja/models/coffee_Item.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetails extends StatefulWidget {
  final CoffeeItem cItem;
  const ItemDetails({super.key, required this.cItem});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.black,
          ),
          Hero(
            tag: widget.cItem.itemImg.toString(),
            child: Container(
              height: (screenHeight / 2) + 120,
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                      image: AssetImage(widget.cItem.itemImg!),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 35,
            left: 10,
            child: Container(
              color: Colors.transparent,
              height: 50,
              width: screenWidth - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFF14181D),
                        border: Border.all(color: Color(0xFF322B2E), width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF525154),
                        size: 17.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFF14181D),
                        border: Border.all(color: Color(0xFF322B2E), width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        EvaIcons.heart,
                        color: Color(0xFF525154),
                        size: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: (screenHeight / 2) - 30,
            child: GlassmorphicContainer(
              width: screenWidth,
              height: 150,
              borderRadius: 30,
              border: 0,
              blur: 4,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.6),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0),
                ],
              ),
              child: Container(
                height: 140,
                width: screenWidth - 20,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 25,
                      ),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cItem.title!,
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.cItem.subtitle!,
                            style: GoogleFonts.sourceSansPro(
                              color: Color(0xFFADADAD),
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorPalette.coffeeSelected,
                                size: 22,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.cItem.rating.toString(),
                                style: GoogleFonts.sourceSansPro(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '(6,986)',
                                style: GoogleFonts.sourceSansPro(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.white,
                      padding: EdgeInsets.only(left: 25),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF0F1419),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.coffee,
                                        color: ColorPalette.coffeeSelected,
                                        size: 21),
                                    Text(
                                      'Coffee',
                                      style: GoogleFonts.sourceSansPro(
                                        color: Color(0xFF909193),
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF0F1419),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.water_drop,
                                        color: ColorPalette.coffeeSelected,
                                        size: 21),
                                    Text(
                                      'Milk',
                                      style: GoogleFonts.sourceSansPro(
                                        color: Color(0xFF909193),
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            //THE ROW IS ACTUALLY UNNECCESSARY BECAUSE YOU CAN SIMPLY JUST USE PADDING LEFT: 25, AND IT WILL GIVE YOU THE SAME RESULT, BUT SOMEHOW USING ROW WITH THE MAINAXIS SET TO CENTER ACHIVES THE SAME THIS SO...
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 35,
                                  width: 125,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF0F1419),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Medium Roasted',
                                      style: GoogleFonts.sourceSansPro(
                                        color: Color(0xFF909193),
                                        fontSize: 12,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (screenHeight / 2) + 140,
            child: Container(
              height: screenHeight / 2 - 140,
              width: screenWidth,
              child: ListView(
                padding: EdgeInsets.only(left: 15),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: GoogleFonts.sourceSansPro(
                            color: Color(0xFF999A9B), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: screenWidth - 30,
                        child: Text(
                          'A cappuccino is a coffee-based drink made primarily from expresso and milk',
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.white, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'size',
                        style: GoogleFonts.sourceSansPro(
                            color: Color(0xFF999A9B), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenWidth - 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSizeButton('S', 0),
                            _buildSizeButton('M', 1),
                            _buildSizeButton('L', 2),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: screenWidth - 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    'Price',
                                    style: GoogleFonts.sourceSansPro(
                                        color: Color(0xFF999A9B), fontSize: 17),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$',
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.bold,
                                            color: ColorPalette.coffeeSelected,
                                            fontSize: 20),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 1),
                                        child: Text(
                                          widget.cItem.price.toString(),
                                          style: GoogleFonts.sourceSansPro(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: (screenWidth / 2) + 50,
                                decoration: BoxDecoration(
                                  color: ColorPalette.coffeeSelected,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSizeButton(String title, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 4),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: index == selectedIndex ? Colors.black : Color(0xFF0D0f14),
            borderRadius: BorderRadius.circular(10),
            border: index == selectedIndex
                ? Border.all(
                    color: ColorPalette.coffeeSelected,
                    style: BorderStyle.solid,
                    width: 1)
                : Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 0.2),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.sourceSansPro(
                color: index == selectedIndex
                    ? ColorPalette.coffeeSelected
                    : Color(0xFFADADAD),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
