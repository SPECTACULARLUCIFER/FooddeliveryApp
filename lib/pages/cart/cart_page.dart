import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              AppIcon(icon: Icons.arrow_back_ios,
              iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20*5,),
                GestureDetector(
                  onTap: () {
                     Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.home_outlined,
                                iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(icon: Icons.shopping_cart,
              iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
                ),
             ],
          )
          ),
          GetBuilder<CartController>(builder: (_cartController){
             return _cartController.getItems.length>0? Positioned(
            top: Dimensions.height20*5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (CartController){
                  var _cartList = CartController.getItems;
                  return ListView.builder(
                   itemCount: _cartList.length,
                  itemBuilder: (_, index){
                    return Container(
                      width: double.maxFinite,
                      height: Dimensions.height20*5,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              var popularIndex = Get.find<PopularProductController>()
                              .popularProductList
                              .indexOf(_cartList[index].product!);
                              if (popularIndex>=0){
                                   Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartpage"));
                              }else{
                                var recommendedIndex = Get.find<RecommendedProductController>()
                              .recommendedProductList
                              .indexOf(_cartList[index].product!);
                              if(recommendedIndex<0){
                                 Get.snackbar("History product", "Product review is not available for history product",
                                  backgroundColor: AppColors.mainColor,
                                  colorText: Colors.white
                                  );
                              }else{
                                Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,"cartpage"));
                              }
                              }
                            },
                            child: Container(
                              width: Dimensions.height20*5,
                              height:Dimensions.height20*5,
                              margin: EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:NetworkImage(
                                    CartController.getItems[index].img!
                                  )),
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10,),
                          Expanded(child: Container(
                            height: Dimensions.height20*5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(text: CartController.getItems[index].name!, color: Colors.black54,),
                                SmallText(text: "Spicy"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(text: CartController.getItems[index].price.toString(), color: Colors.redAccent,),
                                     Container(
              padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                    GestureDetector(
                    onTap: () {
                        CartController.addItem(_cartList[index].product!, -1);
                    },
                    child: Icon(Icons.remove, color: AppColors.signColor,)),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: _cartList[index].quantity.toString()),//popularProduct.inCartItems.toString()),
                  SizedBox(width: Dimensions.width10/2,),
                  GestureDetector(
                    onTap: () {
                        CartController.addItem(_cartList[index].product!, 1);
                        print("being tapped");
                    },
                    child: Icon(Icons.add, color: AppColors.signColor,))
                ],
              ),
            ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      );
                });
                })
              ),
            )
            ):NoDataPage(text: "Your cart is empty!");
          })
        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (CartController) {
        return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2), 
            topRight: Radius.circular(Dimensions.radius20*2))
        ),
        child: CartController.getItems.length>0?Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                   
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text:"\$"+CartController.totalAmount.toString()),
                  SizedBox(width: Dimensions.width10/2,),
                  
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // popularProduct.addItem(product);
                print("tapped");
                CartController.addToHistory();
              },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20),
                
                  child: BigText(text: "Check out", color: Colors.white,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor
                ),
              ),
            ),
          
          ],
        ):Container(),
      );
      },),
    );
  }
}