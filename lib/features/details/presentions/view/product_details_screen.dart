import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networks/api_clints.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/data_source/details_remote_data_source.dart';
import '../../data/data_source/details_remote_data_source_imp.dart';
import '../../data/repository/details_repository_imp.dart';
import '../../domain/repository/details_repository.dart';
import '../../domain/use_cases/details_use_case.dart';
import '../view_model/details_cubit.dart';
import '../view_model/details_state.dart';
import 'widgets/share_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final ApiClints apiClints = ApiClints();
    final ProductDetailsRemoteDataSource productDetailsRemoteDataSource =
        ProductDetailsRemoteDataSourceImp(apiClints);
    final ProductDetailsRepository productDetailsRepository =
        ProductDetailsRepositoryImp(productDetailsRemoteDataSource);
    final ProductDetailsUseCase productDetailsUseCase = ProductDetailsUseCase(
      productDetailsRepository: productDetailsRepository,
    );
    return BlocProvider(
      create: (context) =>
          DetailsCubit(productDetailsUseCase)
            ..getProductDetails(productId: productId),
      child: ProductDetailsView(productId: productId),
    );
  }
}

class ProductDetailsView extends StatefulWidget {
  final int productId;
  const ProductDetailsView({super.key, required this.productId});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
Widget build(BuildContext context) {
  return BlocBuilder<DetailsCubit, DetailsState>(
    builder: (context, state) {
      if (state is DetailsLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (state is DetailsSuccess) {
        final product = state.productDetailsEntity;

        return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: AppTheme.background,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              ShareButton(productId: widget.productId),
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_border, size: 18),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'product-${product.id}',
                child: Image.network(
                  product.images?.first ??
                      'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              transform: Matrix4.translationValues(0.0, -32.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                         product.title ?? '',
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(fontSize: 28, height: 1.2),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '\$${product.price!.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(color: AppTheme.primary, fontSize: 24),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description ?? '',
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(height: 1.6, fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    // Text(
                    //   'Select Color',
                    //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // ColorSelector(
                    //   colors: widget.product.colors,
                    //   selectedColor: _selectedColor,
                    //   onColorSelected: (color) {
                    //     setState(() {
                    //       _selectedColor = color;
                    //     });
                    //   },
                    // ),
                    // const SizedBox(height: 24),
                    // Text(
                    //   'Select Size',
                    //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // SizeSelector(
                    //   sizes: widget.product.sizes,
                    //   selectedSize: _selectedSize,
                    //   onSizeSelected: (size) {
                    //     setState(() {
                    //       _selectedSize = size;
                    //     });
                    //   },
                    // ),
                    // const SizedBox(height: 32),
                    PrimaryButton(
                      text: 'Add to Cart',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${product.title ?? ''} added to cart',
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppTheme.primary,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
      }

      if (state is DetailsFailure) {
        return Scaffold(
          body: Center(
            child: Text(state.errorMessage),
          ),
        );
      }

      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    },
  );
}
}
