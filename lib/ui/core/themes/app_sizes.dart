import 'package:flutter/material.dart';

//AppSizes es una clase singleton que se utiliza para inicializar y almacenar
//las dimensiones de la pantalla del dispositivo. Proporciona un acceso
//centralizado a estas dimensiones para que puedan ser utilizadas en toda
//la aplicacion, facilitando el diseño responsivo.

final class AppSizes {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  void initSizes(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}