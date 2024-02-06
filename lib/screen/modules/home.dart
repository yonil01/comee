import 'package:flutter/material.dart';
import 'package:app_come/components/bottom_navbar.dart';
import 'package:app_come/components/food_item.dart';
import 'package:app_come/screen/modules/entity/register.dart';
import 'package:app_come/screen/modules/location/map.dart';

class FoodItemCardStruct {
  final String imageUrl;
  final String title;
  final String description;
  final String entity;
  final String price;
  final String rating;
  final String comments;

  FoodItemCardStruct({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.entity,
    required this.price,
    required this.rating,
    required this.comments,
  });
}

List<FoodItemCard> foodItemList = [
  FoodItemCard(
    imageUrl: 'https://img.freepik.com/foto-gratis/aperitivo-carne-gourmet-fresca-placa-madera-ia-generativa_188544-7823.jpg?w=740&t=st=1707173668~exp=1707174268~hmac=209cdcc39bcbf9ba0edc4cbdc9dabc5f4aceb4bd7b0f25903bfba25f1abf4dfd',
    title: 'Salchipapa',
    description: 'Con abundante papas.',
    entity: 'Pandita',
    price: 'S/ 9.0',
    rating: '3',
    comments: '12',
  ),
  FoodItemCard(
    imageUrl: 'https://img.freepik.com/foto-gratis/deliciosa-pizza-interior_23-2150873912.jpg?w=360&t=st=1707173725~exp=1707174325~hmac=af22038fbe99a40351958aaed0e443642844ffc6c721b4f1163a369cdc485813',
    title: 'Pizza',
    description: 'Con oregano.',
    entity: 'Dori Burger',
    price: 'S/ 19.0',
    rating: '7',
    comments: '2',
  ),
  FoodItemCard(
    imageUrl: 'https://img.freepik.com/foto-gratis/pila-brownie-chocolate-oscuro-mesa-rustica-generada-ia_24640-84808.jpg?w=826&t=st=1707173801~exp=1707174401~hmac=dfa10a3a925b75a30c852cb51f3b142452211ac9a4cd22c33a42e32e76575e65',
    title: 'Brownie de chocolate',
    description: 'Hay descuentos.',
    entity: 'Dori Burger',
    price: 'S/ 10.0',
    rating: '3',
    comments: '12',
  ),
  FoodItemCard(
    imageUrl: 'https://img.freepik.com/foto-gratis/rebanada-brownie-chocolate-helado-nuez-vainilla_114579-903.jpg?w=360&t=st=1707173905~exp=1707174505~hmac=0221d48006f06c4619f4437b61bd0993a38a47e0d3faaa402cfab545609a888b',
    title: 'Brownie con helado',
    description: 'Incluye healdos de cuaquier sabor.',
    entity: 'Dori Burger',
    price: 'S/ 10.0',
    rating: '3',
    comments: '12',
  ),
  FoodItemCard(
    imageUrl: 'https://img.freepik.com/psd-premium/tomates-sandwich-tostado-muy-apetitoso_176841-88107.jpg?w=740',
    title: 'Sandwitch',
    description: 'Con pan integral.',
    entity: 'Dori Burger',
    price: 'S/ 6.0',
    rating: '3',
    comments: '12',
  ),
  FoodItemCard(
    imageUrl: 'https://img.freepik.com/foto-gratis/apetitoso-arroz-saludable-verduras-plato-blanco-sobre-mesa-madera_2829-19783.jpg?w=740&t=st=1707174082~exp=1707174682~hmac=44d4a2da32dc37d6747813cf9bd9a8e404b86d7fd1ca17e4dbbc62352a283ce5',
    title: 'Combinado',
    description: 'Al gusto del cliente.',
    entity: 'Carlos Chef',
    price: 'S/ 15.0',
    rating: '3',
    comments: '12',
  ),
  // Agregar más objetos según tus necesidades
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int _selectedIndex = 0;

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
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
  if (index == 1) { // Assuming "Soy empresa" is the item at index 1
    // Navigate to the RegisterPage
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
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Text('App Comee'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button press
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Adjust the height to fit your needs
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MapScreen()), // Replace 'Home' with the actual class name of your home widget
                    );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (String value) {
                        // Handle search
                      },
                    ),
                  ),
                ],
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(icon: Icon(Icons.fastfood), text: "Tendencia"),
                  Tab(icon: Icon(Icons.money_off), text: "Precios bajos"),
                  Tab(icon: Icon(Icons.location_on), text: "Cercano"),
                  Tab(icon: Icon(Icons.more_horiz), text: "Otros"),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Drawer contents...
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildTabContent(context, foodItemList),
          buildTabContent(context, foodItemList),
          buildTabContent(context, foodItemList),
          buildTabContent(context, foodItemList),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
      selectedIndex: _selectedIndex,
      onTap: _onItemTapped,
    ),
    );
  }

  Widget buildTabContent(BuildContext context, List<FoodItemCard> foodData) {
  return ListView.builder(
    itemCount: foodData.length,
    itemBuilder: (context, index) {
      FoodItemCard foodItem = foodData[index];

      return FoodItemCard(
        imageUrl: foodItem.imageUrl,
        title: foodItem.title,
        description: foodItem.description,
        entity: foodItem.entity,
        price: foodItem.price,
        rating: foodItem.rating,
        comments: foodItem.comments,
      );
    },
  );
}


}


