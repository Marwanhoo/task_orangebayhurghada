import 'package:flutter/material.dart';
import 'package:task_orangebayhurghada/features/products/view/products/products_grid_view.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsetsDirectional.only(end: 10.0),
        title: Text("Google Books"),
        actions: [

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              sliver: SliverToBoxAdapter(
                child: Text("Programming Books",style: Theme.of(context).textTheme.bodyLarge,),
              ),
            ),
            ProductsGridView(),
          ],
        ),
      ),
    );
  }
}
