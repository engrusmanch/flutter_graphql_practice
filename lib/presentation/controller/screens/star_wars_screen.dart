import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_api_integration_practice/builder_ids.dart';
import 'package:graphql_api_integration_practice/presentation/controller/controller.dart';
import 'package:graphql_api_integration_practice/presentation/controller/widgets/star_wars_widget.dart';

class StarWarsScreen extends StatelessWidget {
  const StarWarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraphQLController>(
        id: starWarsId,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Star Wars Data",
              ),
            ),
            body: controller.starWarsFilmsLoadingState.isLoading
                ? Center(
              child: Column(
                children: [
                  Text("Fetching Films Data"),
                  CircularProgressIndicator(),
                ],
              ),
            )
                : SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(
                    controller.starWarsFilmsData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                          child: StarWarsWidget(film:controller.starWarsFilmsData[index]),
                        )
                ),
              ),
            ),
          );
        }
    );
  }
}
