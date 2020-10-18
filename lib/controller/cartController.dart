import 'package:get/get.dart';
import 'package:getxmode/model/productModel.dart';

class CartController extends GetxController{
  var cartItems = List<Product>().obs;
  double get totalPrice => cartItems.fold(0, (sum,item) => sum + item.price);
  int get cartSize => cartItems.length;
//  int qty = 0;
//  int get increase => qty++;
//  int get decrease{
//    if(qty>=0){
//      return 0;
//    }
//    else{
//      return qty--;
//    }
//  }


  addToCart(Product product){
    cartItems.add(product);

  }

  deleteToCart(){
    if(cartSize!=0){
      cartItems.removeLast();
    }
  }


}