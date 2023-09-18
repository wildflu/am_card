library first;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AwsCard extends StatefulWidget {
  AwsCard({super.key, required this.text, required this.size, required this.image, required this.onBuyClicked, required this.tails, required this.prodColorsDespo, required this.promution, required this.price, required this.oldPrice, required this.description});
  final String text;
  final int size;
  final Image image;
  final VoidCallback onBuyClicked;
  final List<String> tails ;
  final List<Color> prodColorsDespo;
  final int promution ;
  final double price;
  final double oldPrice;
  final String description;

  @override
  State<AwsCard> createState() => _AwsCardState();
}

class _AwsCardState extends State<AwsCard> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(width: 1, color: Colors.black),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 5,
            color: Colors.black12
          )
        ],
        color: Colors.white
      ),

      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: widget.image
                ),
                Positioned(
                  top: 15,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('${widget.promution} %', style: TextStyle(fontSize: 10),),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 20,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star_border),
                        Text('$likes')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("${widget.description}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                            Text('${widget.price}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text('${widget.oldPrice}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300, decoration: TextDecoration.lineThrough, ))),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: widget.prodColorsDespo.map((e) => Circular(color: e, litter: null)).toList(),
                      ),
                      Row(
                        children: widget.tails.map((e) => Circular(color: Colors.black, litter: e)).toList(),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: IconButton(onPressed: (){
                          setState(() {
                            likes = (likes == 0) ?1:0;
                          });
                        }, icon: Icon(CupertinoIcons.heart, color: likes == 0 ?Colors.grey:Colors.red,))),
                      Expanded(
                        flex: 5,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 5)
                          ),
                          onPressed: widget.onBuyClicked, icon: Icon(Icons.shopify_sharp), label: Text('Buy')),
                      )
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
class Circular extends StatelessWidget {
  const Circular({super.key, required this.color, required this.litter});
  final Color color;
  final String ?litter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: color),
        borderRadius: BorderRadius.circular(20)
      ),
      child: litter == null ? null:Text(litter!),
    );
  }
}