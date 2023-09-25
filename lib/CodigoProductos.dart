import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  int stock;
  final String imageUrl;

  Product(this.name, this.stock, this.imageUrl);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Product> products = [
    Product('Sabritas 490 g', 5,
        'https://supermode.com.mx/cdn/shop/products/PAPASABRITASSAL490GR..jpg'),
    Product('Cocacola 600 ml', 3,
        'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00000007500761L.jpg'),
    Product('Kit Kat', 0,
        'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00789100024836L.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Productos'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(products[index].imageUrl),
              ),
              title: Text(products[index].name),
              subtitle: Text('Stock: ${products[index].stock}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (products[index].stock > 0) {
                        setState(() {
                          // Incrementar el stock
                          products[index].stock--;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        // Incrementar el stock
                        products[index].stock++;
                      });
                    },
                  ),
                ],
              ),
              tileColor: products[index].stock == 0
                  ? const Color.fromARGB(255, 109, 109, 109).withOpacity(0.5)
                  : null,
            );
          },
        ),
      ),
    );
  }
}
