import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';


class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            //height: 175,
            height: MediaQuery.of(context).size.height / 5,
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () async {
                    if (!await launchUrl(Uri.parse('https://flutter.dev'))) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        loadingBuilder: (_, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(child: CircularProgressIndicator());
                        },
                        image: NetworkImage(AppStrings.marwanHoo),
                        fit: BoxFit.cover,
                        height: 175,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 4,
            effect: const WormEffect(
              activeDotColor: Colors.red,
              dotColor: Colors.grey,
              dotHeight: 15,
              dotWidth: 15,
            ),
            onDotClicked: (index) {},
          ),
        ],
      ),
    );
  }
}

