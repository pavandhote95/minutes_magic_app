import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/home/controllers/home_controller.dart';


class BannerCarousel extends StatelessWidget {
  BannerCarousel({super.key});

  final HomeController controller = Get.find<HomeController>();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final images = controller.bannerImages;

      if (images.isEmpty) {
        return const SizedBox(
          height: 170,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Text("Image not found")),
                ),
              );
            },
            options: CarouselOptions(
              height: 170,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.95,
              onPageChanged: (index, reason) {
                controller.currentBannerIndex.value = index;
              },
            ),
          ),

     

          /// ✅ SmoothPageIndicator
         


        ],
      );
    });
  }
}
