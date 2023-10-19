import 'dart:developer';

import 'package:coffee2/color_palette.dart';
import 'package:coffee2/models/coffee_item.dart';
import 'package:coffee2/widgets/search_bar.dart';
import 'package:colorful_iconify_flutter/icons/fluent_emoji_flat.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';


class DashboradPage extends StatefulWidget {
  const DashboradPage({Key? key}) : super(key: key);

  @override
  State<DashboradPage> createState() => _DashboradPageState();
}

class _DashboradPageState extends State<DashboradPage> {
  final List<String> coffeeTypes=[
  'Cappuccino',
  'Espresso',
  'Latte',
  'Flat white',
  
  ];

  String selectedItem='Cappuccino';
  int counter=-1;
  
 final List<CoffeeItem> coffeelist=[
  CoffeeItem(rating: 4.5,itemImg:'assets/img/1.png',price:4.21,subtitle: 'With Oat Milk',title: 'Cappuccino'  ),
  CoffeeItem(rating: 4.5,itemImg:'assets/img/2.png',price:3.21,subtitle: 'With Chocolate',title: 'Latte'  ),
  CoffeeItem(rating: 4.5,itemImg:'assets/img/3.png',price:4.21,subtitle: 'With Oat Milk',title: 'Espresso'  ),

  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().ScaffoldBg,
      bottomNavigationBar: _buildBottomBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F242C),
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Iconify(HeroiconsSolid.view_grid,
                    size:12.0,color: Color(0xFF4D4F52) ,),
               
                    ),

                  ),
                  GestureDetector(
                    onTap: (){

                    },
                   child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F242C),
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Iconify(HeroiconsSolid.view_grid,
                    size:12.0,color: Color(0xFF4D4F52) ,),
               
                    ),
                  )

              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0,top: 15.0),
              width: (MediaQuery.of(context).size.width/3)* 2  + 25.0,
              child: Text('Find the best Coffe for you',
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35.0,
              ),),
            ),
            SizedBox(height:20.0),
            SearchBar(),
           SizedBox(height:20.0),
           Padding(padding:EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
           child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment(0.7,-1.0),
                end: Alignment(1.0,-1.0),
                colors: <Color>[Colors.black,Colors.transparent] )
                .createShader(bounds);
            } ,
            blendMode: BlendMode.dstATop,
            child: Container(
              color: Color(0xFF0D0F14),
              width: MediaQuery.of(context).size.width-20.0,
              height: 40.0,
              child: ListView(
                scrollDirection:Axis.horizontal,
                children: [
                  ...coffeeTypes.map((e) {
               counter++;
                 if(counter<=3)
                return _buildTypes(e, counter);
                else{
                  counter=0;
                  return _buildTypes(e, counter);
                }

                  }).toList()
                ], ),
            ),

            )), 
            Container(
              height:( MediaQuery.of(context).size.height/2)-50.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: EdgeInsets.only(top: 5.0),
                children: [
                 Padding (padding: EdgeInsets.only(left: 15.0,right: 15.0),
                 child: Container(
                  color: Color(0xFF0D0F14),
                  width: MediaQuery.of(context).size.width-10.0,
                  height: 225.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                 children: [
                  ...coffeelist.map((e){
                    return _buildCoffeeItem(e);

                  })

                 ],
                 ),),
              )],
                
              )
              ,
            )
          
          ],
        ),
      ),
    );
    
  }
  Widget _buildCoffeeItem(CoffeeItem cItem){
    return Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
    child: GestureDetector(
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              ColorPalette().gradientTopLeft,
              Colors.black

            ]
          )
         ),
         height:200.0 ,
         width: 150.0,
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.0,
            width: 150.0,
            child: Stack(children: [
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Hero(
                  tag: cItem.itemImg.toString(),
                  child: Container(
                    height: 120.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(image:
                      AssetImage(cItem.itemImg!),
                      fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                  ),
                ))
            ]),
            )
        


         ]),
      ),


    ),
    );
  }
  Widget _buildTypes(String coffee, int counter) {
  return Padding(
    padding: counter != 0
        ? EdgeInsets.only(left: 25.0)
        : EdgeInsets.only(left: 7.0),
    child: Container(
      height: 50.0,
      color: Color(0xFF0D0F14),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedItem = coffee;
              });
            },
            child: Text(
              coffee,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                color: coffee == selectedItem
                    ? ColorPalette().coffeSelected
                    : ColorPalette().coffeUnSelected,
                fontSize: 17.0,
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: coffee == selectedItem
                  ? ColorPalette().coffeSelected
                  : Colors.transparent,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget _buildBottomBar(){
  return Container(
    padding: EdgeInsets.only(left: 25.0,right: 25.0) ,
    height: 50.0,
    decoration: BoxDecoration(
      color: Color(0xFF1A1819)
    ), 
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Container(
        child: Iconify(
          FluentMdl2.home_solid,
          color: Color(0xFFD17742),
        ),
      ),
      Iconify(
        Ph.handbag_fill,
       color: Color(0xFF4E4F53)
      ),
      Iconify(
        Ri.heart_2_fill,
        color: Color(0xFF4E4F53),
      ),
      Container(
        child: Stack(
          children: [
            Iconify(HeroiconsSolid.bell,
              color: Color(0xFF4E4F53),),
              Positioned(
                top:2.0 ,
                left: 15.0,
                child:Container(
                  height: 7.0,
                  width: 7.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.red
                  ),
                ),
                              )
          ],
        )
      )
    ]),);
}


}