import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';
import 'package:task_orangebayhurghada/features/products/view/widgets/product_grid_view_item.dart';
import 'package:task_orangebayhurghada/features/products/viewmodel/products_cubit.dart';
import 'package:task_orangebayhurghada/features/products/viewmodel/products_state.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(child: Text(state.error));
        } else if (state is ProductsSuccessState) {
          List<ProductModel> products = state.products;
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  ((MediaQuery.of(context).size.width - 26) / 2) / 360,
            ),
            itemBuilder: (context, index) {
              ProductModel product = products[index];
              return ProductGridViewItem(product: product);
            },
            itemCount: products.length,
          );
        } else {
          return SliverToBoxAdapter(child: Container());
        }
      },
    );
  }
}
