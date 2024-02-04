import 'package:app_come/screen/modules/home.dart';
import 'package:app_come/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen arriba
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Subtítulo "Bienvenido"
            Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),

            SizedBox(height: 20),

            // Campo Número de celular
            TextField(
              decoration: InputDecoration(
                hintText: 'Ingresa el código enviado',
                hintStyle: TextStyle(fontSize: 14.0),
                labelText: 'Verificar Código',
                labelStyle: TextStyle(fontSize: 14.0),
                alignLabelWithHint:
                    true, // Añadido para alinear el label con el hint
              ),
              keyboardType: TextInputType.phone,
              textAlign:
                  TextAlign.center, // Añadido textAlign: TextAlign.center
              style: TextStyle(fontSize: 14.0),
            ),

            SizedBox(height: 20),

            // Botón de obtener código
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage()), // Replace 'Home' with the actual class name of your home widget
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
              ],
            ),

            SizedBox(height: 10),

            // Línea con texto "o continuar con"
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.text1Color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'o continuar con',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.text1Color,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.text1Color,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Botones de ingresar con Google y Facebook

            SizedBox(height: 20),

            // Texto "De que trata? Visitar"
            RichText(
              text: TextSpan(
                text: 'Otra cuenta? ',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.text1Color,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Iniciar sesion',
                    style: TextStyle(
                      color: AppColors.btnBluwe,
                      decoration: TextDecoration.underline,
                    ),
                    // Agrega aquí la acción al hacer clic en "Visitar"
                    // onTap: () {
                    //   // Acción al hacer clic en "Visitar"
                    // },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
