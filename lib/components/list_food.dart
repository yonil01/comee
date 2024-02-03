import 'package:flutter/material.dart';
import 'package:app_come/components/card.dart';

class FoodItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            for (int index = 0; index < 10; index++)
              Column(
                children: [
                  Stack(
                    children: [
                      FoodItemCard(
                        title: 'Pepper Mayo Cruncher Combo',
                        subtitle: 'Pepper Mayo Cruncher + Fries + Drink',
                        price: 'S. 19',
                        imageUrl: 'imagen1.png',
                        imageSize: Size(100, 100),
                        likes: 12,
                        comments: 12,
                      ),
                      Positioned(
                        bottom:
                            0, // Ajusta la posición vertical según sea necesario
                        right:
                            8.0, // Ajusta la posición horizontal según sea necesario
                        child: FloatingActionButton(
                          onPressed: () {
                            // Acción al presionar el botón "Ver"
                          },
                          backgroundColor: Colors.red,
                          mini: true, // Hace que el botón sea más pequeño
                          child: Text('Ver'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Ajusta la altura según sea necesario
                ],
              ),
          ],
        );
      },
    );
  }
}
