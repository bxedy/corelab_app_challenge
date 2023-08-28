import 'package:corelab_app_challenge/core/ui/components/height.dart';
import 'package:corelab_app_challenge/core/ui/theme/app_text_styles.dart';
import 'package:corelab_app_challenge/modules/search/presentation/components/search_bar.dart';
import 'package:flutter/material.dart';

import '../components/search_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomSearchBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(24),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Pesquisas recentes", style: AppTextStyles().medium),
              ),
              const Height(6),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const SearchItem();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
