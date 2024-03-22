import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_api_integration_practice/builder_ids.dart';
import 'package:graphql_api_integration_practice/presentation/controller/controller.dart';
import 'package:graphql_api_integration_practice/presentation/controller/widgets/anilist_widget.dart';

class AnilistScreen extends StatelessWidget {
  const AnilistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GraphQLController controller = Get.find();
    return GetBuilder<GraphQLController>(
      id: anilistId,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Anilist Data",
            ),
          ),
          body: controller.anilistLoadingState.isLoading
              ? Center(
                  child: Column(
                    children: [
                      Text("Fetching Anilist Data"),
                      CircularProgressIndicator(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                child: Column(
                    children: List<Widget>.generate(
                      controller.aniListData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                        child: AnilistWidget(entity:controller.aniListData[index]),
                      )
                    ),
                  ),
              ),
        );
      }
    );
  }
}
