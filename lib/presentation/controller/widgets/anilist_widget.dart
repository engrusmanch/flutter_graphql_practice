import 'package:flutter/material.dart';
import 'package:graphql_api_integration_practice/constants.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/anilist.dart';

class AnilistWidget extends StatelessWidget {
  final AniListEntity entity;

  const AnilistWidget({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title (English): ${entity.title!.english}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Title (Native): ${entity.title!.native}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(entity.description!),
            SizedBox(height: 16),
            Text(
              'Character Images:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: entity.characters!.length,
                itemBuilder: (context, index) {
                  final characterImage = entity.characters![index].image;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      characterImage!.large!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          placeholderImage,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

