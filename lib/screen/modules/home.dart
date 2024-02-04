import 'package:flutter/material.dart';
import 'package:app_come/components/bottom_navbar.dart';
import 'package:app_come/components/food_item.dart';
import 'package:app_come/screen/modules/entity/register.dart';
import 'package:app_come/screen/modules/location/map.dart';

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
          buildTabContent(context),
          buildTabContent(context),
          buildTabContent(context),
          buildTabContent(context),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
      selectedIndex: _selectedIndex,
      onTap: _onItemTapped,
    ),
    );
  }

  Widget buildTabContent(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return FoodItemCard();
      },
    );
  }
}


