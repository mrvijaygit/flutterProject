import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/provider/product_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test/screens/product_view_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Future.wait([
      Provider.of<ProductProvider>(context, listen: false).getProductAPI()
    ]).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ProductProvider>(context, listen: false).getProductDetails;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('Product List'),
        ),
        body: _isLoading
            ? const Center(
                child: SpinKitCircle(
                  color: Colors.blueGrey,
                  size: 40,
                ),
              )
            : ListView.builder(
                itemCount: provider.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15),
                    child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductViewScreen(
                                productId: provider[index].id,
                              )));
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: provider[index].imageUrl != null
                                    ? NetworkImage(provider[index].imageUrl!)
                                    : const AssetImage('assets/img/logo.png')
                                as ImageProvider<Object>,
                              ),
                              title: Text(provider[index].name!),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(provider[index].slug!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey
                                  ),),
                                  Text(provider[index].description ?? 'Description')
                                ],
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios,
                              color: Colors.grey,),
                            ),
                          ),
                        )),
                  );
                },
              ));
  }
}

