import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context ) {
    CartModel lsProducts = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Panier EpsiShop")),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Votre panier contient ${context.watch<CartModel>().getCount()} produits",
                style: Theme.of(context).textTheme.headline6,),
              Expanded(
                  child: ListView.builder(
                      itemCount: context.watch<CartModel>().getCount(),
                      itemBuilder: (context, index) => ListTile(
                            title: Text(
                                lsProducts.getProducts()[index].nom),
                            subtitle: Text(lsProducts.getProducts()[index].displayPriceInEuro()),
                            leading:Hero(
                              tag: context.watch<CartModel>().getProducts()[index].nom,
                              child: Image.network(context.watch<CartModel>().getProducts()[index].image,
                                width: 80,height: 80,),
                            ),

                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: ()  {
                                lsProducts.remove(lsProducts.getProducts()[index]);
                              },
                            ),
                          ))),


              Text("Votre panier total est de : " + context.watch<CartModel>().total.toStringAsFixed(2) +
                  " €",
                style: Theme.of(context).textTheme.headline6,
              )

            ],
          ),
        ),
      ),
    );
  }
}
