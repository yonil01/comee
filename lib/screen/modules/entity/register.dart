import 'package:flutter/material.dart';
import 'package:app_come/utils/colors.dart';
import 'package:app_come/screen/modules/entity/info.dart';
import 'package:app_come/services/entity/entity_service.dart';
import 'package:app_come/services/entity/person_service.dart';
import 'package:app_come/services/reniec/entity_service.dart';
import 'package:app_come/utils/spinner.dart';

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
  final TextEditingController nameEntityController = TextEditingController();
  final TextEditingController descriptionEntityController =
      TextEditingController();
  final TextEditingController telephoneEntityController =
      TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController encodeEntityController = TextEditingController();

  final TextEditingController dniPersonController = TextEditingController();
  final TextEditingController namePersonController = TextEditingController();
  final TextEditingController lastnamePersonController =
      TextEditingController();
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
                controller: nameEntityController,
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
                controller: descriptionEntityController,
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
                      controller: telephoneEntityController,
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
                      controller: mobileController,
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
                controller: dniPersonController,
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
                    onPressed: () async {

                      // LoadingOverlay.showLoadingStatic(true);

                     /* Map<String, dynamic> formData = {
                          'dni': dniPersonController.text
                        };

                      Map<String, dynamic>? responseData = await GetDataReniec(formData);

                      // Check if the response data is not null and contains a 'name' key
                      if (responseData != null && responseData.containsKey('nombres')) {
                        // Assign the 'name' value to namePersonController
                        namePersonController.text = responseData['nombres'];
                        lastnamePersonController.text = responseData['apellidoPaterno'] + ' ' + responseData['apellidoMaterno'];
                      } else {
                        // Handle the case where the response data is null or doesn't contain the 'name' key
                        print('Error: Unable to retrieve name from response');
}*/
                    },
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: namePersonController,
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
                controller: lastnamePersonController,
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
                        
                        /*Map<String, dynamic> formData = {
                          'name': nameEntityController.text,
                          'description': descriptionEntityController.text,
                          'telephone': telephoneEntityController.text,
                          'mobile': mobileController.text,
                          'location_x': '12121313',
                          'location_y': '1323232'
                        };
                        Map<String, dynamic> formDataPerson = {
                          'name': nameEntityController.text,
                          'lastname': descriptionEntityController.text
                        };

                        // Send data to the POST service
                        CreateBasicInformationEntity(formData);
                        CreateBasicInformationPerson(formData);*/
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
