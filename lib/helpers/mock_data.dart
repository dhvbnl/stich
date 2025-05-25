// import 'package:stich/models/top.dart';
// import 'package:stich/models/bottom.dart';
// import 'package:stich/models/shoes.dart';
// import 'package:stich/helpers/top_type.dart';
// import 'package:stich/helpers/bottom_type.dart';
// import 'package:stich/helpers/shoes_type.dart';
// import 'package:stich/helpers/clothing_color.dart';
// import 'package:stich/helpers/clothing_material.dart';

// List<Top> getMockTops() {
//   return [
//     Top(
//         id: 1,
//         primaryColor: ClothingColor.white,
//         secondaryColor: ClothingColor.black,
//         material: ClothingMaterial.cotton,
//         type: TopType.tshirt),
//     Top(
//         id: 2,
//         primaryColor: ClothingColor.black,
//         secondaryColor: ClothingColor.gray,
//         material: ClothingMaterial.polyester,
//         type: TopType.longSleeve),
//     Top(
//         id: 3,
//         primaryColor: ClothingColor.lightBlue,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.denim,
//         type: TopType.buttonDown),
//     Top(
//         id: 4,
//         primaryColor: ClothingColor.beige,
//         secondaryColor: ClothingColor.brown,
//         material: ClothingMaterial.wool,
//         type: TopType.sweater),
//     Top(
//         id: 5,
//         primaryColor: ClothingColor.green,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.linen,
//         type: TopType.shirt),
//     Top(
//         id: 6,
//         primaryColor: ClothingColor.red,
//         secondaryColor: ClothingColor.black,
//         material: ClothingMaterial.silk,
//         type: TopType.jacket),
//     Top(
//         id: 7,
//         primaryColor: ClothingColor.gray,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.cotton,
//         type: TopType.sweatshirt),
//     Top(
//         id: 8,
//         primaryColor: ClothingColor.brown,
//         secondaryColor: ClothingColor.beige,
//         material: ClothingMaterial.wool,
//         type: TopType.buttonDown),
//     Top(
//         id: 9,
//         primaryColor: ClothingColor.yellow,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.cotton,
//         type: TopType.tankTop),
//     Top(
//         id: 10,
//         primaryColor: ClothingColor.navyBlue,
//         secondaryColor: ClothingColor.lightBlue,
//         material: ClothingMaterial.polyester,
//         type: TopType.polo),
//   ];
// }

// List<Bottom> getMockBottoms() {
//   return [
//     Bottom(
//         id: 11,
//         primaryColor: ClothingColor.navyBlue,
//         secondaryColor: ClothingColor.black,
//         material: ClothingMaterial.denim,
//         type: BottomType.jeans),
//     Bottom(
//         id: 12,
//         primaryColor: ClothingColor.black,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.polyester,
//         type: BottomType.sweatpants),
//     Bottom(
//         id: 13,
//         primaryColor: ClothingColor.beige,
//         secondaryColor: ClothingColor.brown,
//         material: ClothingMaterial.cotton,
//         type: BottomType.chinos),
//     Bottom(
//         id: 14,
//         primaryColor: ClothingColor.gray,
//         secondaryColor: ClothingColor.black,
//         material: ClothingMaterial.wool,
//         type: BottomType.trousers),
//     Bottom(
//         id: 15,
//         primaryColor: ClothingColor.white,
//         secondaryColor: ClothingColor.cyan,
//         material: ClothingMaterial.linen,
//         type: BottomType.shorts),
//     Bottom(
//         id: 16,
//         primaryColor: ClothingColor.green,
//         secondaryColor: ClothingColor.brown,
//         material: ClothingMaterial.cotton,
//         type: BottomType.cargo),
//     Bottom(
//         id: 17,
//         primaryColor: ClothingColor.red,
//         secondaryColor: ClothingColor.black,
//         material: ClothingMaterial.leather,
//         type: BottomType.leggings),
//     Bottom(
//         id: 18,
//         primaryColor: ClothingColor.navyBlue,
//         secondaryColor: ClothingColor.gray,
//         material: ClothingMaterial.spandex,
//         type: BottomType.cordoroy),
//     Bottom(
//         id: 19,
//         primaryColor: ClothingColor.purple,
//         secondaryColor: ClothingColor.pink,
//         material: ClothingMaterial.velvet,
//         type: BottomType.skirt),
//     Bottom(
//         id: 20,
//         primaryColor: ClothingColor.orange,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.rayon,
//         type: BottomType.jeans),
//   ];
// }

// List<Shoes> getMockShoes() {
//   return [
//     Shoes(
//         id: 21,
//         primaryColor: ClothingColor.white,
//         secondaryColor: ClothingColor.black,
//         material: ClothingMaterial.leather,
//         type: ShoesType.sneakers),
//     Shoes(
//         id: 22,
//         primaryColor: ClothingColor.black,
//         secondaryColor: ClothingColor.gray,
//         material: ClothingMaterial.polyester,
//         type: ShoesType.slippers),
//     Shoes(
//         id: 23,
//         primaryColor: ClothingColor.brown,
//         secondaryColor: ClothingColor.beige,
//         material: ClothingMaterial.leather,
//         type: ShoesType.boots),
//     Shoes(
//         id: 24,
//         primaryColor: ClothingColor.gray,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.rayon,
//         type: ShoesType.sneakers),
//     Shoes(
//         id: 25,
//         primaryColor: ClothingColor.navyBlue,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.canvas,
//         type: ShoesType.loafers),
//     Shoes(
//         id: 26,
//         primaryColor: ClothingColor.red,
//         secondaryColor: ClothingColor.black,
//         material: ClothingMaterial.leather,
//         type: ShoesType.sandals),
//     Shoes(
//         id: 27,
//         primaryColor: ClothingColor.white,
//         secondaryColor: ClothingColor.beige,
//         material: ClothingMaterial.suede,
//         type: ShoesType.flats),
//     Shoes(
//         id: 28,
//         primaryColor: ClothingColor.lightBlue,
//         secondaryColor: ClothingColor.gray,
//         material: ClothingMaterial.spandex,
//         type: ShoesType.slippers),
//     Shoes(
//         id: 29,
//         primaryColor: ClothingColor.green,
//         secondaryColor: ClothingColor.white,
//         material: ClothingMaterial.cotton,
//         type: ShoesType.sneakers),
//     Shoes(
//         id: 30,
//         primaryColor: ClothingColor.black,
//         secondaryColor: ClothingColor.green,
//         material: ClothingMaterial.leather,
//         type: ShoesType.heels),
//   ];
// }
