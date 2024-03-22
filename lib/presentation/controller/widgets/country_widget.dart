import 'package:flutter/material.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/country.dart';

class CountryWidget extends StatelessWidget {
  final CountryEntity country;

  const CountryWidget({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Country: ${country.name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Code: ${country.code}',
              ),
              Text(
                'Emoji: ${country.emoji}',
              ),
              Text(
                'Currencies: ${country.currencies!.join(", ")}',
              ),
              Text(
                'Phone: ${country.phone}',
              ),
              Text(
                'Capital: ${country.capital}',
              ),
              Text(
                'Languages: ${country.languages!.map((language) => '${language.name} (${language.native})').join(", ")}',
              ),
              Text(
                'States: ${country.states!.isEmpty ? "N/A" : country.states!.map((state) => state.name).join(", ")}',
              ),
              Text(
                'Continent: ${country.continent!.name}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}