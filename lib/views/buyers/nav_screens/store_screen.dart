import 'package:flutter/material.dart';
import 'package:trade_x/views/buyers/nav_screens/cart_screen.dart';

// Define a simple Store class
class Store {
  final String name;
  final List<Product> products;

  Store({required this.name, required this.products});
}

// Define a simple Product class
class Product {
  final String name;
  final double price;
  final String imageUrl; // URL of the product image

  Product({required this.name, required this.price, required this.imageUrl});
}

// Define a StoreScreen widget
class StoreScreen extends StatelessWidget {
  final List<Store> stores = [
    Store(
      name: 'Clothing',
      products: [
        Product(
          name: 'Unisex Jeans',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1598507/pexels-photo-1598507.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Dress',
          price: 20.49,
          imageUrl: 'https://images.pexels.com/photos/985635/pexels-photo-985635.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Men Tshirt',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/428311/pexels-photo-428311.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Shoes',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Unisex Jacket',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1040945/pexels-photo-1040945.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Women Skirt',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1007018/pexels-photo-1007018.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
      ],
    ),
    Store(
      name: 'Dairy',
      products: [
        Product(
          name: 'Milk',
          price: 10.99,
          imageUrl: 'https://imgs.search.brave.com/TkJjsZ4GIiSPZ0u8QaHnpyTlr1wM0Ud_w-xH5JBeRlE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/ZnNoaW55LmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAxOC8w/OC9NSUxLLVBPVUNI/LmpwZw', // Example image URL
        ),
        Product(
          name: 'Cheese',
          price: 20.49,
          imageUrl: 'https://imgs.search.brave.com/-gkUiXeoRORkYtw1qgo1TK7pK5yGLGaBXbPEhe4uOOA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTE0/OTgxNjQ0L3Bob3Rv/L2NoZWVzZS5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9V096/YUdMeGtqdlFONEpk/M0M0YlQ3YjU5Mmpk/dTNpQVo5a1E3cTkz/eXVYOD0', // Example image URL
        ),
        Product(
          name: 'Butter',
          price: 10.99,
          imageUrl: 'https://imgs.search.brave.com/8gMteG5zBYkx4oJqYSg_OpNw7ie5WVoJZzffwp7tbb4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAwLzg4LzkzLzkx/LzM2MF9GXzg4OTM5/MTU3X3FPRGdpdVhn/djZKZTFuaUJQekw5/dThGaHVtN0dBOFNx/LmpwZw', // Example image URL
        ),
        Product(
          name: 'Yoghurt',
          price: 10.99,
          imageUrl: 'https://imgs.search.brave.com/6cMRZnE6zP5twpDLP0Cn9vCgKwSRFa74hrgMjUNcnOs/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTE1/Nzc3ODA4L3Bob3Rv/L3lvZ3VydC5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9MXhO/ZjJxMGhtbmRxQWJx/eVRVVXY2Rl9HYkJo/aENaa0dIYmlPRVJ6/OTFMRT0', // Example image URL
        ),
        Product(
          name: 'Icecream',
          price: 10.99,
          imageUrl: 'https://imgs.search.brave.com/zqMsIgcuxOGJGsCqSlDBSJhrqI7m1SotaAoSo_5X1A0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTcw/OTQwNDc3L3Bob3Rv/L2ljZS1jcmVhbS5q/cGc_cz02MTJ4NjEy/Jnc9MCZrPTIwJmM9/eWtnWm5qSlc3X0sx/MTVNMmVPamROckdV/Q1hwaTNLRjF1aEN4/NmNUWVlzdz0', // Example image URL
        ),
        Product(
          name: 'Paneer',
          price: 10.99,
          imageUrl: 'https://imgs.search.brave.com/m0bZYcEGohX0CZc0W_c7nKizEt7RIhWg_6jIJW6469k/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/aW5kaWFuaGVhbHRo/eXJlY2lwZXMuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE4/LzEyL3BhbmVlci5q/cGcud2VicA', // Example image URL
        ),
      ],
    ),
    Store(
      name: 'Groceries',
      products: [
        Product(
          name: 'Ginger',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1337585/pexels-photo-1337585.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Tomato',
          price: 20.49,
          imageUrl: 'https://images.pexels.com/photos/1327838/pexels-photo-1327838.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Banana',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/2238309/pexels-photo-2238309.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Potato',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/2286776/pexels-photo-2286776.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Spinach',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/2325843/pexels-photo-2325843.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Papaya',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/5945743/pexels-photo-5945743.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
      ],
    ),
    Store(
      name: 'Electronics',
      products: [
        Product(
          name: 'Laptop',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'LED TV',
          price: 20.49,
          imageUrl: 'https://images.pexels.com/photos/1682519/pexels-photo-1682519.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Printer',
          price: 10.99,
          imageUrl: 'https://media.istockphoto.com/id/1195859472/photo/the-printer-is-fully-functional-located-on-the-desk.jpg?s=612x612&w=0&k=20&c=j1T2PVL5kX4mOYmq-BnnhFSoHLFGMTJ6DoIfv5V7Z7A=', // Example image URL
        ),
        Product(
          name: 'Mobile phone',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Smart watch',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/393047/pexels-photo-393047.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Toaster',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/7936636/pexels-photo-7936636.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
      ],
    ),
    Store(
      name: 'Home Decor',
      products: [
        Product(
          name: 'Curtains',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1366879/pexels-photo-1366879.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Flower Vase',
          price: 20.49,
          imageUrl: 'https://images.pexels.com/photos/1809345/pexels-photo-1809345.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Bedsheet',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/763146/pexels-photo-763146.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Wall Clock',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/3283142/pexels-photo-3283142.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Painting',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1070536/pexels-photo-1070536.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Photo Frame',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1214205/pexels-photo-1214205.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
      ],
    ),

    Store(
      name: 'Cosmetics',
      products: [
        Product(
          name: 'Lipstick',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/1377034/pexels-photo-1377034.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Eyeliner',
          price: 20.49,
          imageUrl: 'https://images.pexels.com/photos/2517447/pexels-photo-2517447.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Talcum Powder',
          price: 10.99,
          imageUrl: 'https://imgs.search.brave.com/SJpCv9IoZ_cSDw45yC7T21kfiZnuGsOmj392OSnNk4A/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/dmVyeXdlbGxoZWFs/dGguY29tL3RobWIv/VVYzMmxOZmhaVXRC/Mk9xUWtpRENfOU1s/cnFvPS8xNTAweDAv/ZmlsdGVyczpub191/cHNjYWxlKCk6bWF4/X2J5dGVzKDE1MDAw/MCk6c3RyaXBfaWNj/KCkvR2V0dHlJbWFn/ZXMtMTE4OTUzMDQ3/Ny0yM2FhNmE4NmU2/ODg0MzRmOTUwODA4/MzQ3YjFlYzY5NC5q/cGc', // Example image URL
        ),
        Product(
          name: 'Moisturizer',
          price: 10.99,
          imageUrl: 'https://imgs.search.brave.com/PP3WsZbvceQtSTI-zn2ha-qbsOZ4c8-0wnPw7AgWNtk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/bXVyYWQuY29tL2Nk/bi9zaG9wL2NvbGxl/Y3Rpb25zL21vaXN0/dXJpemVycy5qcGc_/dj0xNzA2MjI1MDE3', // Example image URL
        ),
        Product(
          name: 'Shampoo',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/3735657/pexels-photo-3735657.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
        Product(
          name: 'Foundation',
          price: 10.99,
          imageUrl: 'https://images.pexels.com/photos/13534782/pexels-photo-13534782.jpeg?auto=compress&cs=tinysrgb&w=600', // Example image URL
        ),
      ],
    ),
    // Add more stores as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
          itemCount: stores.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsPage(store: stores[index]),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                child: Center(
                  child: Text(
                    stores[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Define a ProductsPage widget
class ProductsPage extends StatefulWidget {
  final Store store;

  ProductsPage({required this.store});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> cartItems = []; // List to hold cart items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cartItems),
                ),
              );
            },
          ),
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  cartItems.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: widget.store.products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(widget.store.products[index].name),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          widget.store.products[index].imageUrl,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${widget.store.products[index].price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Add the selected product to the cart
                          setState(() {
                            cartItems.add(widget.store.products[index]);
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Add to Cart'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                elevation: 4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        widget.store.products[index].imageUrl,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.store.products[index].name,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$${widget.store.products[index].price.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StoreScreen(),
  ));
}
