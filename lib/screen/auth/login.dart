import 'package:app_come/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_come/screen/auth/verify.dart';


class LoginPage extends StatelessWidget {

  
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
                labelText: 'Número de celular:',
                prefixIcon: Icon(Icons.phone),
                prefixText: '+51 ',
                labelStyle: TextStyle(
                    fontSize: 14.0), // Ajusta el valor según sea necesario
                // También puedes ajustar el tamaño del texto en el prefijo
                prefixStyle: TextStyle(fontSize: 14.0),
              ),
              keyboardType: TextInputType.phone,
              style: TextStyle(
                  fontSize: 14.0), // Ajusta el valor según sea necesario
            ),

            SizedBox(height: 20),

            // Botón de obtener código
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla 'Verify'
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VerifyPage()), // Asegúrate de que VerifyScreen es el nombre correcto de tu pantalla 'verify.dart'
                );
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.btnSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onPrimary: Colors.black, // Agregar esto para el color del texto
              ),
              child: Text(
                'Obtener Código',
                style: TextStyle(
                  color: AppColors.text1Color,
                ),
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Acción al presionar el botón de Google
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.btnBluwe,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  icon: Container(
                    padding: EdgeInsets.all(8.0), // Ajusta según sea necesario
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // Establecer el color de fondo del contenedor
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SvgPicture.asset(
                      'assets/google.svg', // Reemplaza con la ruta correcta de tu archivo SVG de Google
                      height: 15.0, // Ajusta según sea necesario
                      width: 15.0, // Ajusta según sea necesario
                    ),
                  ),
                  label: Text(
                    'Google',
                    style: TextStyle(
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Acción al presionar el botón de Facebook
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.btnBlackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPrimary: AppColors
                        .textWhite, // Esto establecerá el color del icono y el texto
                  ),
                  icon: Icon(
                    Icons.facebook,
                    weight: 15,
                  ),
                  label: Text('Facebook'),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Texto "De que trata? Visitar"
            RichText(
              text: TextSpan(
                text: 'De que trata? ',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.text1Color,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Visitar',
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
