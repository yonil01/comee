import 'package:flutter/material.dart';
import 'package:app_come/components/bottom_navbar.dart';
import 'package:app_come/screen/modules/entity/food_item.dart';
import 'package:app_come/screen/modules/entity/register.dart';

class FoodItem {
  final String imageUrl;
  final String foodName;
  final String foodDescription;
  final double price;
  final int rating;
  final int numberOfComments;

  FoodItem({
    required this.imageUrl,
    required this.foodName,
    required this.foodDescription,
    required this.price,
    required this.rating,
    required this.numberOfComments,
  });
}

List<FoodItem> foodItemList = [
  FoodItem(
    imageUrl: 'https://img.freepik.com/psd-gratis/hamburguesa-ternera-fresca-aislada-sobre-fondo-transparente_191095-9018.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1706918400&semt=ais',
    foodName: 'Nombre del Platillo 1',
    foodDescription: 'Descripción del Platillo 1',
    price: 19.0,
    rating: 5,
    numberOfComments: 12,
  ),
  FoodItem(
    imageUrl: 'https://img.freepik.com/psd-gratis/hamburguesa-ternera-fresca-aislada-sobre-fondo-transparente_191095-9018.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1706918400&semt=ais',
    foodName: 'Nombre del Platillo 1',
    foodDescription: 'Descripción del Platillo 1',
    price: 19.0,
    rating: 5,
    numberOfComments: 12,
  ),
  FoodItem(
    imageUrl: 'https://img.freepik.com/psd-gratis/hamburguesa-ternera-fresca-aislada-sobre-fondo-transparente_191095-9018.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1706918400&semt=ais',
    foodName: 'Nombre del Platillo 1',
    foodDescription: 'Descripción del Platillo 1',
    price: 19.0,
    rating: 5,
    numberOfComments: 12,
  ),
  FoodItem(
    imageUrl: 'https://img.freepik.com/psd-gratis/hamburguesa-ternera-fresca-aislada-sobre-fondo-transparente_191095-9018.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1706918400&semt=ais',
    foodName: 'Nombre del Platillo 1',
    foodDescription: 'Descripción del Platillo 1',
    price: 19.0,
    rating: 5,
    numberOfComments: 12,
  ),
  FoodItem(
    imageUrl: 'https://img.freepik.com/psd-gratis/hamburguesa-ternera-fresca-aislada-sobre-fondo-transparente_191095-9018.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1706918400&semt=ais',
    foodName: 'Nombre del Platillo 1',
    foodDescription: 'Descripción del Platillo 1',
    price: 19.0,
    rating: 5,
    numberOfComments: 12,
  ),
  // Agregar más objetos según tus necesidades
];

class InfoEntityPage extends StatefulWidget {
  @override
  _InfoEntityPageState createState() => _InfoEntityPageState();
}

int _selectedIndex = 0;

class _InfoEntityPageState extends State<InfoEntityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterEntityPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('El Dorado'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Acción para agregar una nueva comida
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://img.lovepik.com/photo/50108/6151.jpg_wh860.jpg',
                fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Información del Restaurante',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Número de celular: 123456789',
                                style: TextStyle(fontSize: 14)),
                            Text('Dirección: Calle Falsa 123',
                                style: TextStyle(fontSize: 14)),
                            Text('Número de teléfono: 987654321',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Acción para editar la información del restaurante
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lista de tus comidas',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        child: Text(
                          'Agregar',
                          style: TextStyle(color: Colors.white), // Text color
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Button background color
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: foodItemList.length,
              itemBuilder: (context, index) {
                FoodItem item = foodItemList[index];

                return FoodItemCardTest(
                  imageUrl: item.imageUrl,
                  foodName: item.foodName,
                  foodDescription: item.foodDescription,
                  price: item.price,
                  rating: item.rating,
                  numberOfComments: item.numberOfComments,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
