import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/components/height.dart';
import '../../../../core/ui/theme/app_text_styles.dart';
import '../../../shared/presentation/components/item_widget.dart';
import '../components/no_results_widget.dart';
import '../components/search_bar.dart';
import '../components/search_item.dart';
import '../controllers/search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = Modular.get<SearchControlller>()..fetchHistory();

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
                  if (state == SearchPageState.initial &&
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
                            .map((e) => SearchItem(name: e, onTap: () => controller.fetchSearch(e)))
                            .toList(),
                      ],
                    );
                  } else if (state == SearchPageState.success && controller.searchResults.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("${controller.searchResults.length} resultados encontrados",
                              style: AppTextStyles().medium),
                        ),
                        const Height(6),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.searchResults.length,
                          itemBuilder: (context, index) {
                            final item = controller.searchResults[index];
                            return ItemWidget(productEntity: item);
                          },
                        ),
                      ],
                    );
                  } else if (state == SearchPageState.success && controller.searchResults.isEmpty) {
                    return const NoResultsWidget();
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
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
