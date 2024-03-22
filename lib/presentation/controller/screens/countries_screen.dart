import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_api_integration_practice/builder_ids.dart';
import 'package:graphql_api_integration_practice/presentation/controller/controller.dart';
import 'package:graphql_api_integration_practice/presentation/controller/widgets/country_widget.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraphQLController>(
        id: countriesId,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Countries Data",
              ),
            ),
            body: controller.countriesLoadingState.isLoading
                ? Center(
              child: Column(
                children: [
                  Text("Fetching Countries Data"),
                  CircularProgressIndicator(),
                ],
              ),
            )
                : SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(
                    controller.countriesData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 8),
                          child: CountryWidget(country:controller.countriesData[index]),
                        )
                ),
              ),
            ),
          );
        }
    );
  }
}
