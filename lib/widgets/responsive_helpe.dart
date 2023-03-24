import 'package:wallet_app/widgets/app_constant.dart';
import 'package:wallet_app/widgets/size_config.dart';

class ResponsiveHelper {
  static double responsiveHeight(double height) {
    return (height / kResponsiveHeightReference) * SizeConfig.heightMultiplier!;
  }

  static double responsiveWidth(double width) {
    return (width / kResponsiveWidthReference) * SizeConfig.widthMultiplier!;
  }

  static double responsiveText(double fontSize) {
    return (fontSize / kResponsiveHeightReference) * SizeConfig.textMultiplier!;
  }

  static double responsiveImage(double imageHeight) {
    return (imageHeight / kResponsiveWidthReference) *
        SizeConfig.imageSizeMultiplier!;
  }
}
