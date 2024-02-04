import 'package:flutter/material.dart';
import 'package:app_come/components/bottom_navbar.dart';
import 'package:app_come/screen/modules/entity/food_item.dart';
import 'package:app_come/screen/modules/entity/register.dart';

class InfoEntityPage extends StatefulWidget {
  @override
  _InfoEntityPageState createState() => _InfoEntityPageState();
}

int _selectedIndex = 0;

class _InfoEntityPageState extends State<InfoEntityPage> with SingleTickerProviderStateMixin {
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
            Image.network('https://img.lovepik.com/photo/50108/6151.jpg_wh860.jpg', fit: BoxFit.cover),
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
                            Text('Información del Restaurante', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Número de celular: 123456789', style: TextStyle(fontSize: 14)),
                            Text('Dirección: Calle Falsa 123', style: TextStyle(fontSize: 14)),
                            Text('Número de teléfono: 987654321', style: TextStyle(fontSize: 14)),
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
                      Text('Lista de tus comidas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return FoodItemCardTest();
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
