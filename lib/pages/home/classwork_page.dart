// import 'package:flutter/material.dart';
// import 'package:food_delivery/pages/home/food_page_body.dart';
// import 'package:food_delivery/utils/colors.dart';
// import 'package:food_delivery/utils/dimensions.dart';
// import 'package:food_delivery/widgets/big_text.dart';
// import 'package:food_delivery/widgets/small_text.dart';

// class ClassworkPage extends StatefulWidget {
//   const ClassworkPage({super.key});

//   @override
//   State<ClassworkPage> createState() => _MainFoodPageState();
// }

// class _MainFoodPageState extends State<ClassworkPage> {
//   bool isDarkMode = false;

//   @override
//   Widget build(BuildContext context) {
//     Color backgroundColor = isDarkMode ? Colors.black : Colors.white;
//     Color textColor = isDarkMode ? Colors.white : Colors.black;
//     Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Column(
//         children: [
//           // Header with toggle
//           Container(
//             margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
//             padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     BigText(text: "Bangladesh", color: AppColors.mainColor),
//                     Row(
//                       children: [
//                         SmallText(text: "Narsingdi", color: subTextColor),
//                         Icon(Icons.arrow_drop_down_rounded, color: subTextColor),
//                       ],
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     // Theme toggle switch
//                     Switch(
//                       value: isDarkMode,
//                       onChanged: (value) {
//                         setState(() {
//                           isDarkMode = value;
//                         });
//                       },
//                       activeColor: AppColors.mainColor,
//                     ),
//                     Container(
//                       width: Dimensions.width45,
//                       height: Dimensions.height45,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(Dimensions.radius15),
//                         color: AppColors.mainColor,
//                       ),
//                       child: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                         size: Dimensions.iconSize24,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Body
//           Expanded(
//             child: SingleChildScrollView(
//               child: FoodPageBody(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
