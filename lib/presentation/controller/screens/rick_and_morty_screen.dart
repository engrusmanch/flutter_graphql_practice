import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_api_integration_practice/builder_ids.dart';
import 'package:graphql_api_integration_practice/presentation/controller/controller.dart';
import 'package:graphql_api_integration_practice/presentation/controller/widgets/character_widget.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraphQLController>(
        id: charactersId,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Characters Data",
              ),
            ),
            body: controller.characterDataLoadingState.isLoading
                ? Center(
                    child: Column(
                      children: [
                        Text("Fetching Characters Data"),
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
                : (controller.characterDataLoadingState.errorOccurred)
                    ? Center(child: Text(controller.error))
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildRickyMortyChip(
                                selectedController: controller,
                                label: "Rick",
                                context: context,
                                onSelected: (selected, label) =>
                                    controller.setCharacter(
                                        label: label, selected: selected),
                              ),
                              buildRickyMortyChip(
                                selectedController: controller,
                                label: "Morty",
                                context: context,
                                onSelected: (selected, label) =>
                                    controller.setCharacter(
                                        label: label, selected: selected),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: List<Widget>.generate(
                                    controller.characterData.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: CharacterWidget(
                                              character: controller
                                                  .characterData[index]),
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
          );
        });
  }
}

Widget buildRickyMortyChip({
  required GraphQLController selectedController,
  required BuildContext context,
  required String label,
  void Function(bool selected, String label)? onSelected,
}) {
  return Container(
    margin: EdgeInsets.only(right: 8),
    child: ChoiceChip(
      selected: selectedController.selectedCharacters.contains(label),
      selectedColor: Theme.of(context).colorScheme.secondaryContainer,
      onSelected: (isSelected) {
        if (onSelected != null) {
          onSelected(isSelected, label);
        }
      },
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      label: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    ),
  );
}
