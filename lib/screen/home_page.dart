import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;
import 'package:products/Model/data_models.dart';
import 'package:products/screen/details.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? dataModel;

  var cutingPrice = ["\$ 200"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Product'),
        ),
        body: dataModel != null && dataModel!.products.isNotEmpty
            ? GridView.builder(
                itemCount: dataModel!.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    crossAxisCount: 2,
                    // mainAxisExtent: 400      //** size height increse */
                    childAspectRatio: 2 / 2.4 //** size height increse */
                    ),
                itemBuilder: (_, index) {
                  var eachProduct = dataModel!.products![index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                  thisProduct: dataModel!.products[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          // height: 260,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                    // color: Colors.blue,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            eachProduct.thumbnail!),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  eachProduct.title!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Image.asset(
                                  //   "images/doller.png",
                                  //   scale: 22,
                                  // ),
                                  Text(
                                    // "  \$ ${eachProduct.price!.toString()}",
                                    "  \u{20B9} ${eachProduct.price!.toString()}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Text("${cutingPrice}")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : Container(
                child: Center(
                  child: Text('No Products '),
                ),
              ));
  }

  void getProduct() async {
    var uri = Uri.parse("https://dummyjson.com/products");

    var response = await httpClient.get(uri);

    // print("code:${response.statusCode}");
    // print("status:${response.body}");

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      dataModel = DataModel.fromJson(mData);
      setState(() {});
      print(dataModel);
    }
  }
}
