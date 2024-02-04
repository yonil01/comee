import 'package:flutter/material.dart';

class FoodItemCardTest extends StatefulWidget {
  @override
  _FoodItemCardTestState createState() => _FoodItemCardTestState();
}

class _FoodItemCardTestState extends State<FoodItemCardTest> {
  bool isAvailable = true; // Estado para el Switch de disponibilidad

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://img.freepik.com/psd-gratis/hamburguesa-ternera-fresca-aislada-sobre-fondo-transparente_191095-9018.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1706918400&semt=ais', // Asegúrate de reemplazar con una imagen válida
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Pepper Mayo Cruncher Combo',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('Pepper Mayo Cruncher + Fries + Drink'),
                    SizedBox(height: 10), // Add some spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('S/. 19'), // You might want to format the price
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.red),
                              onPressed: () {
                                // Acción para editar
                              },
                            ),
                            Transform.scale(
                              scale:
                                  0.6, // Ajusta este valor para cambiar el tamaño visual del Switch
                              child: Switch(
                                value: isAvailable,
                                onChanged: (value) {
                                  setState(() {
                                    isAvailable = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Add some spacing
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.amber, size: 20), // Star icon
                        SizedBox(width: 5), // Space between icon and text
                        Text('5'), // Rating
                        SizedBox(
                            width: 10), // Space between rating and comments
                        Icon(Icons.comment,
                            color: Colors.grey, size: 20), // Comment icon
                        SizedBox(width: 5), // Space between icon and text
                        Text('12'), // Number of comments
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
