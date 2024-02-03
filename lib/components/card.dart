import 'package:app_come/utils/colors.dart';
import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final int likes;
  final int comments;
  final String imageUrl;
  final Size imageSize;

  FoodItemCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.likes,
    required this.comments,
    required this.imageUrl,
    this.imageSize = const Size(100, 100), // Tamaño predeterminado
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(subtitle),
                      Row(
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          SizedBox(width: 8.0),
                          
                          SizedBox(width: 4.0),
                          Text(
                            '$likes',
                            style: TextStyle(
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text1Color),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '$comments Comentarios',
                            style: TextStyle(
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text1Color),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                imageUrl,
                width: imageSize.width,
                height: imageSize.height,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
