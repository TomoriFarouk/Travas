import 'package:carousel_pro/carousel_pro.dart' show Carousel;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> image;
  final String width;
  const CarouselSliderWidget(this.image, this.width);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: width == 'full' ? 300.h : 220.h,
        width: MediaQuery.of(context).size.width,
        child: Carousel(
          autoplay: false,
          images: [
            ExactAssetImage(image[0]),
            ExactAssetImage(image[1]),
            ExactAssetImage(image[2]),
          ],
          dotIncreasedColor: Colors.blue,
          showIndicator: true,
          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Colors.lightBlueAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.transparent,
          borderRadius: true,
        ),
      ),
    );
  }
}
