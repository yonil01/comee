import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String entity;
  final String price;
  final String rating;
  final String comments;

  FoodItemCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.entity,
    required this.price,
    required this.rating,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {


    print(this.imageUrl);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              imageUrl,
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
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(description),
                    SizedBox(height: 5),
                    Text(
                      entity,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(price),
                        ElevatedButton(
                          child: Text(
                            'Ver',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 5),
                        Text(rating),
                        SizedBox(width: 10),
                        Icon(Icons.comment, color: Colors.grey, size: 20),
                        SizedBox(width: 5),
                        Text(comments),
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
