import 'package:flutter/material.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/star_wars.dart';

class StarWarsWidget extends StatelessWidget {
  final FilmEntity film;

  const StarWarsWidget({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${film.title}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Director: ${film.director}',
            ),
            SizedBox(height: 8),
            Text(
              'Release Date: ${film.releaseDate}',
            ),
            SizedBox(height: 8),
            Text(
              'Opening Crawl: ${film.openingCrawl}',
            ),
            SizedBox(height: 8),
            Text(
              // 'Characters: ${film.characters!.join(", ")}',
                'Characters: ${film.characters!.map((e) => e.toString()).toList().join(", ")}'
            ),
            SizedBox(height: 8),
            Text(
              'Producers: ${film.producers!.join(", ")}',
            ),
          ],
        ),
      ),
    );
  }
}