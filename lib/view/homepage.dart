
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmode/controller/cartController.dart';

import 'package:getxmode/controller/shoppingController.dart';
class HomePage extends StatelessWidget {
  final _shoppingController = Get.put(ShoppingController());
  final _cartController = Get.put(CartController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clarion"),
        leading: IconButton(
          icon: Icon(Icons.remove_shopping_cart),
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            icon: Icon(Icons.shopping_cart),
            label: GetX<CartController>(
                builder: (controller) {
                  return Text('${controller.cartSize}');
                }
            ),
          ),
          SizedBox(width: 40,),
          FloatingActionButton(
            child: Icon(Icons.remove_shopping_cart),

            onPressed: (){
              _cartController.deleteToCart();
            },
          ),

        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount:  controller.products.length,
                    itemBuilder: (context,index){
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,



                                children: [

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                        '${controller.products[index].productDescription}',

                                      ),



                                    ],
                                  ),

                                  Text(
                                    '${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24),
                                  ),



                                ],


                              ),
                              RaisedButton(

                                onPressed: (){

                                  _cartController.addToCart(controller.products[index]);

                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
//            GetX<CartController>(
//              builder: (controller) {
//                return Text('Total Amount: ${controller.totalPrice}',style: TextStyle(fontSize: 30), );
//              }
//            ),
          GetBuilder<CartController>(builder: (controller){
            return Text('${controller.testAmount}');
          }),
            SizedBox(height: 100,)

          ],
        ),
      ),
    );
  }
}
