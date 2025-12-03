import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:task_orangebayhurghada/data/model/banner_model.dart';
import 'package:task_orangebayhurghada/features/banners/viewmodel/banners_cubit.dart';
import 'package:task_orangebayhurghada/features/banners/viewmodel/banners_state.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return BlocConsumer<BannersCubit, BannersStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is BannersLoadingState) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BannersFailureState) {
          return SliverToBoxAdapter(child: Text(state.error));
        } else if (state is BannersSuccessState) {
          List<BannerModel> banners = state.banners;
          return SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      BannerModel banner = banners[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () async {
                          if (!await launchUrl(
                            Uri.parse('https://flutter.dev'),
                          )) {
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
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              image: NetworkImage(banner.image),
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
                  count: banners.length,
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
        } else {
          return SliverToBoxAdapter(child: Container());
        }
      },
    );
  }
}
