import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/domain/enums/page_state_enum.dart';
import '../../../../core/ui/components/app_divider.dart';
import '../../../../core/ui/components/height.dart';
import '../../../../core/ui/theme/app_text_styles.dart';
import '../../../shared/presentation/components/product_widget.dart';
import '../../../shared/presentation/components/products_shimmer_skeleton_widget.dart';
import '../../domain/enum/search_type_enum.dart';
import '../components/custom_search_bar.dart';
import '../components/no_results_widget.dart';
import '../components/search_item.dart';
import '../controllers/search_controller.dart';

class SearchPage extends StatefulWidget {
  final String? categoryToSearch;

  const SearchPage({
    Key? key,
    this.categoryToSearch,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = Modular.get<SearchControlller>()..fetchHistory();

  @override
  void initState() {
    if (widget.categoryToSearch != null) {
      controller.search(widget.categoryToSearch!, searchType: SearchType.byCategory);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchBar(controller: controller),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(24),
              ValueListenableBuilder(
                valueListenable: controller.pageState,
                builder: (context, state, child) {
                  if (state == PageState.initial &&
                      controller.searchTextEditingController.text.isEmpty &&
                      controller.searchHistory.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Pesquisas recentes", style: AppTextStyles().medium),
                        ),
                        const Height(6),
                        ...controller.searchHistory
                            .map(
                              (e) => SearchItem(
                                name: e,
                                onTap: () => controller.onHistoryClick(e),
                              ),
                            )
                            .toList(),
                      ],
                    );
                  } else if (state == PageState.success && controller.searchResults.value.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("${controller.searchResults.value.length} resultados encontrados",
                              style: AppTextStyles().medium),
                        ),
                        const Height(6),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.searchResults.value.length,
                          itemBuilder: (context, index) {
                            final item = controller.searchResults.value[index];
                            return Column(
                              children: [
                                const AppDivider(),
                                ProductWidget(productEntity: item),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  } else if (state == PageState.success && controller.searchResults.value.isEmpty) {
                    return NoResultsWidget(search: controller.searchTextEditingController.text);
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Procurando...", style: AppTextStyles().medium),
                        ),
                        const Height(6),
                        const ProductsShimmerSkeletonWidget(),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
