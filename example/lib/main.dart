

import 'package:first/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    title: "App",
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(
      //   child: Center(
          // child: AwsCard(
          //   description: 'None For Now',
          //   oldPrice: 35,
          //   price: 30.24,
          //   promution: 12,
          //   image: Image.network( 'https://images.pexels.com/photos/2536965/pexels-photo-2536965.jpeg?auto=compress&cs=tinysrgb&w=600', fit: BoxFit.cover,height: double.infinity,),
          //   size: 100,
          //   text: 'some tolk about this product',
          //   tails: const ['X','S'],
          //   prodColorsDespo: [Colors.red, Colors.black, Colors.orange, Colors.grey],
          //   onBuyClicked: (){
          //     print('hi');
          //   },
          // ),
        // ),
      // )
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5),
        itemCount: 5,
        itemBuilder: (context, index) {
          return AwsCard(
            description: 'None For Now',
            oldPrice: 35,
            price: 30.24,
            promution: 12,
            image: Image.network( 'https://images.pexels.com/photos/2536965/pexels-photo-2536965.jpeg?auto=compress&cs=tinysrgb&w=600', fit: BoxFit.cover,height: double.infinity,),
            size: 100,
            text: 'some tolk about this product',
            tails: const ['X','S'],
            prodColorsDespo: [Colors.red, Colors.black, Colors.orange, Colors.grey],
            onBuyClicked: (){
              print('hi');
            },
          );
        },),
    );
  }
}