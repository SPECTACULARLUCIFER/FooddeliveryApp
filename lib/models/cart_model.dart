import 'package:food_delivery/models/products_model.dart';

// class CartModel {
//   int ? id;
//   String? name;
//   int? price;
//   String? img;
//   int? quantity;
//   bool? isExist;
//   String? time;
//   ProductModel? product;
 
  
  


//   CartModel({
//     this.id,
//     this.name,
//     this.price,
//     this.img,
//     this.quantity,
//     this.isExist,
//     this.time,
//     this.product,
//   });

//   CartModel.fromJson(Map<String,dynamic> json)
//   {
//     id=json['id'];
//     name=json['name'];
//     price=json['price'];
//     img=json['img'];
//     quantity=json['quantity'];
//     isExist=json['isExist'];
//     time=json['time'];
//     product=ProductModel.fromJson(json['product']);
    
//   }

//   Map<String, dynamic> toJson(){
//     return {
//     "id":this.id,
//     "name":this.name,
//     "price":this.price,
//     "img":this.img,
//     "quantity":this.quantity,
//     "isExist":this.isExist,
//     "time":this.time,
//     "product":this.product!.toJson()
//     };

//   }
// }

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];

    if (json['product'] != null && json['product'] is Map<String, dynamic>) {
      product = ProductModel.fromJson(json['product']);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "img": img,
      "quantity": quantity,
      "isExist": isExist,
      "time": time,
      "product": product?.toJson() ?? {},
    };
  }
}
