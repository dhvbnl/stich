import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_type.dart';
import 'package:stich/helpers/conversions.dart';
import 'package:stich/models/bottom.dart';
import 'package:stich/models/shoes.dart';
import 'package:stich/models/top.dart';
import 'package:stich/providers/closet_provider.dart';
import 'package:stich/providers/suggestions_provider.dart';

class ClosetView extends StatelessWidget {
  const ClosetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ClosetProvider, SuggestionsProvider>(
        builder: (context, closet, suggestions, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              _tops(closet),
              _bottoms(closet),
              _shoes(closet)
            ],
          ),
        ),
      );
    });
  }

  Widget _title() {
    return const Row(
      children: [
        Text(
          'Your Closet',
          style: TextStyle(
            fontFamily: 'PlaywriteUSTrad',
            fontSize: 35,
          ),
        )
      ],
    );
  }

  Widget _tops(ClosetProvider closet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tops',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...closet.tops.map(
                (top) =>
                    _clothingItem(top.imageUrl, ClothingType.top, top: top),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _bottoms(ClosetProvider closet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bottoms',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...closet.bottoms.map(
                (bottom) => _clothingItem(
                  bottom.imageUrl,
                  ClothingType.bottom,
                  bottom: bottom,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _shoes(ClosetProvider closet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shoes',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 150,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              ...closet.shoes.map(
                (shoe) => _clothingItem(
                  shoe.imageUrl,
                  ClothingType.shoes,
                  shoes: shoe,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _clothingItem(String url, ClothingType type,
      {Top? top, Bottom? bottom, Shoes? shoes}) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: getSvgFromArticle(
        type: type,
        topType: top?.type,
        bottomType: bottom?.type,
        shoesType: shoes?.type,
        primaryColor: top?.primaryColor ??
            bottom?.primaryColor ??
            shoes?.primaryColor ??
            ClothingColor.white,
        secondaryColor: top?.secondaryColor ??
            bottom?.secondaryColor ??
            shoes?.secondaryColor ??
            ClothingColor.white,
      ),
      // child: Image.network(
      //   url,
      //   width: 100,
      //   errorBuilder: (context, error, stackTrace) {
      //     return Container(
      //       width: 100,
      //       color: Colors.grey,
      //       child: const Icon(
      //         CupertinoIcons.photo,
      //         size: 50,
      //         color: Colors.white,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
