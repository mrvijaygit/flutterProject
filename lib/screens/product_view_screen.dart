import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class ProductViewScreen extends StatefulWidget {
  final int? productId;
  const ProductViewScreen({Key? key,this.productId}) : super(key: key);

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ProductProvider>(context, listen: false).
        getProductDetails.firstWhere((element) => element.id == widget.productId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(provider.name!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CircleAvatar(
                radius : 50,
                backgroundImage: provider.imageUrl != null
                    ? NetworkImage(provider.imageUrl!)
                    : const AssetImage('assets/img/logo.png')
                as ImageProvider<Object>,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(provider.name!),
              ),
              Text(provider.slug!,
                  style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey
              )),
              Text(provider.description ?? 'Description')
            ],
          ),
        ),
      ),
    );
  }
}
