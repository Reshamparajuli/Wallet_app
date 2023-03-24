import 'package:flutter/widgets.dart';

class SizeConfig {
  /// A variable that is used to store the screen width of the device.
  static double? _screenWidth;

  /// A variable that is used to store the screen height of the device.
  static double? _screenHeight;

  /// A variable that is used to store the screen height of the device.
  static double? height;

  /// A variable that is used to store the screen height of the device.
  static double? width;

  /// A variable that is used to store the width of the screen.
  static double _blockWidth = 0;

  /// Used to store the height of the screen.
  static double _blockHeight = 0;

  /// A variable that is used to store the text size of the device.
  static double? textMultiplier;

  /// Used to calculate the size of the image.
  static double? imageSizeMultiplier;

  /// Used to calculate the height of the screen.
  static double? heightMultiplier;

  /// Used to calculate the width of the screen.
  static double? widthMultiplier;

  /// Used to check the orientation of the device.
  static bool isPortrait = true;

  /// Used to check the orientation of the device.
  static bool isMobilePortrait = false;

  /// A function that is used to calculate the screen size of the device.
  ///
  /// Args:
  ///   constraints (BoxConstraints): The constraints passed to the parent widget.
  ///   orientation (Orientation): Orientation.portrait or Orientation.landscape
  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;

      /// This is used to check if the device is a mobile device or not.
      if (_screenWidth! < 470) {
        //450
        isMobilePortrait = true;
      }
    }

    /// Used to check the orientation of the device.
    else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    /// Dividing the screen width and height by 100.
    _blockWidth = _screenWidth! / 100;
    _blockHeight = _screenHeight! / 100;

    /// Used to calculate the size of the text, image, height and width of the screen.
    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}
