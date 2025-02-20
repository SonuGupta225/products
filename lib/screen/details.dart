import 'package:flutter/material.dart';
import 'package:products/Model/data_models.dart';

class Details extends StatelessWidget {
  ProductModel thisProduct;
  Details({required this.thisProduct});

  var tstyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  var txStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  var boxCoration = BoxDecoration(
      color: const Color.fromARGB(255, 211, 194, 194),
      borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: thisProduct.thumbnail!.length,
                itemBuilder: (_, index) {
                  return Image.network(thisProduct.thumbnail!);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  thisProduct.title!,
                  style: tstyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Text(thisProduct!.price!.toString(), style: tstyle),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: boxCoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(thisProduct.brand!, style: txStyle),
                  )),
              Container(
                  decoration: boxCoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(thisProduct.category!, style: txStyle),
                  )),
              Container(
                  decoration: boxCoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(thisProduct!.stock!.toString(), style: txStyle),
                  )),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                    decoration: boxCoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(thisProduct!.discountPercentage!.toString(),
                          style: txStyle),
                    )),
                SizedBox(
                  width: 30,
                ),
                Container(
                    decoration: boxCoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.redAccent,
                          ),
                          Text(thisProduct!.rating!.toString(), style: txStyle),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
