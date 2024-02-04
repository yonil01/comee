import 'package:flutter/material.dart';
import 'package:app_come/utils/colors.dart';
import 'package:app_come/screen/modules/entity/info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Entity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterEntityPage(),
    );
  }
}

class RegisterEntityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Información'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildSectionTitle(context, 'Información Restaurante'),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(
                    fontSize: 12, // Smaller label text
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1, // Thinner border
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0), // Smaller padding
                ),
              ),

              SizedBox(height: 8.0), // Reduced space to make fields closer
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  labelStyle: TextStyle(
                    fontSize: 12, // Smaller label text
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1, // Thinner border
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0), // Smaller padding
                ),
              ),
              SizedBox(height: 8.0), // Reduced space to make fields closer
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Telefono',
                        labelStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Space between the two fields
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Celular',
                        labelStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.btnBlackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPrimary: AppColors
                            .textWhite, // Esto establecerá el color del texto
                      ),
                      child: Text('Map'),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.btnBlackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPrimary: AppColors
                            .textWhite, // Esto establecerá el color del texto
                      ),
                      child: Text('Foto'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              buildSectionTitle(context, 'Información Personal'),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'DNI',
                  labelStyle: TextStyle(
                    fontSize: 12, // Smaller label text
                  ),
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform search action
                    },
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(fontSize: 12), // Smaller label text
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                ),
                enabled: false, // This disables the TextFormField
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  labelStyle: TextStyle(fontSize: 12), // Smaller label text
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                ),
                enabled: false, // This disables the TextFormField
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text('Atrás'),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  InfoEntityPage()), // Replace 'Home' with the actual class name of your home widget
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.btnBlackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPrimary: AppColors
                            .textWhite, // Esto establecerá el color del texto
                      ),
                      child: Text('Continuar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
