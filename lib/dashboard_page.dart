// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:coffee_raja/color_palette.dart';
import 'package:coffee_raja/screens/item_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:coffee_raja/search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:coffee_raja/models/coffee_Item.dart';

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

  final List<CoffeeItem> coffeeList = [
    CoffeeItem(
        rating: 4.5,
        itemImg: 'images/coffeemain.jpeg',
        price: 4.21,
        subtitle: 'With Oat Milk',
        title: 'Cappuccino'),
    CoffeeItem(
        rating: 4.2,
        itemImg: 'images/secondary.jpeg',
        price: 3.14,
        subtitle: 'With Chocolate',
        title: 'Cappuccino'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0F14),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
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
                padding: EdgeInsets.only(top: 15),
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
                          // counter++;
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
              // COFFEE CONTAINERS
              Container(
                height: (MediaQuery.of(context).size.height / 2) + 50,
                // color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: EdgeInsets.only(top: 8),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        color: Color(0xFF0D0F14),
                        width: MediaQuery.of(context).size.width - 10,
                        height: 270.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...coffeeList.map((e) {
                              return _buildCoffeeItem(e);
                            }).toList()
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 10,
                      ),
                      child: Text(
                        'Special for you',
                        style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 170,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              ColorPalette.gradientTopLeft,
                              Colors.black
                            ],
                          ),
                          // color: Colors.white,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 150,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('images/beansbottom.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                height: 150,
                                width: 150,
                                // color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width -
                                          220,
                                      child: Text(
                                        '5 Coffee Beans You Must Try !',
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildCoffeeItem(CoffeeItem cItem) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ItemDetails(cItem: cItem,),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[ColorPalette.gradientTopLeft, Colors.black],
            ),
          ),
          height: 200,
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Hero(
                        tag: cItem.itemImg.toString(),
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cItem.itemImg!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF342520).withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: ColorPalette.coffeeSelected,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(
                                    cItem.rating.toString(),
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  cItem.title!,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 5, top: 2),
                child: Text(
                  cItem.subtitle!,
                  style: GoogleFonts.sourceSansPro(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 60,
                      child: Row(
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
                              cItem.price.toString(),
                              style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //To Do
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: ColorPalette.coffeeSelected,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.add,
                          size: 11,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypes(coffee, counter) {
    return Padding(
      padding: counter != 0
          ? EdgeInsets.only(left: 25, right: 12)
          : EdgeInsets.only(left: 7),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF1A1819),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttomBarIcon(EvaIcons.home),
            buttomBarIcon(FontAwesomeIcons.bagShopping),
            buttomBarIcon(EvaIcons.heart),
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Stack(
                  children: [
                    Icon(EvaIcons.bell, color: Color(0xFF4E4F53)),
                    Positioned(
                      top: 2,
                      left: 15,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.2),
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buttomBarIcon(IconData icon) {
    return Container(
        child: FaIcon(
      icon,
      color: Color(0xFF4E4F53),
    ));
  }
}
