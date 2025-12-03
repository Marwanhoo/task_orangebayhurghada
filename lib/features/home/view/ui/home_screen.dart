import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:task_orangebayhurghada/features/products/view/ui/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsetsDirectional.only(end: 10.0),
          title: Text("Clothes"),
          actions: [SvgPicture.asset(AppStrings.iconCart)],
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: TabBar(
                // 2. Remove standard underline indicator
                indicatorColor: Colors.transparent,
                // 3. Set text colors
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.black,
                // 4. Remove the default tap splash overlay if desired
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                // 5. Remove the default divider line of the TabBar itself
                dividerColor: Colors.transparent,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  buildTabWithDivider('Product', showDivider: true),
                  buildTabWithDivider('Review', showDivider: true),
                  buildTabWithDivider('Help', showDivider: false),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [ProductScreen(), ReviewSection(), HelpSection()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabWithDivider(String title, {required bool showDivider}) {
    return Tab(
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (showDivider)
            Container(
              height: 24, // Height of the divider
              width: 1,
              color: Colors.grey[300],
            ),
        ],
      ),
    );
  }
}



class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Reviews", style: TextStyle(fontSize: 20)));
  }
}

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Help & FAQ", style: TextStyle(fontSize: 20)),
    );
  }
}
