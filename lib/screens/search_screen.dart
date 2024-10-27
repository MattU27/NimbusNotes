import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/screens/weather_detail_screen.dart';

import '/models/famous_city.dart';
import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/views/famous_cities_weather.dart';
import '/views/gradient_container.dart';
import '/widgets/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.deepCharcoal,
                  AppColors.mutedSlate,
                  AppColors.mutedSlate.withOpacity(.99),
                  AppColors.mutedSlate.withOpacity(.98),
                  AppColors.mutedSlate.withOpacity(.97),
                  AppColors.mutedSlate.withOpacity(.96),
                  AppColors.mutedSlate.withOpacity(.95),
                  AppColors.mutedSlate.withOpacity(.94),
                  AppColors.mutedSlate.withOpacity(.93),
                  AppColors.mutedSlate.withOpacity(.92),
                  AppColors.mutedSlate.withOpacity(.91),
                  AppColors.mutedSlate.withOpacity(.90),
                  AppColors.darkPurple,
                  AppColors.accentPurple,
                  AppColors.lightPurple,
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Enter city name',
                      labelStyle: TextStyle(color: AppColors.paleLilac), 
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: _searchQuery.isEmpty
                      ? Center(
                          child: Text(
                            'Enter a city name to search',
                            style: TextStyle(
                              color: AppColors
                                  .paleLilac, // Change this to your desired color
                            ),
                          ),
                        )
                      : _buildSearchResults(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40.0, // Adjust this value as needed
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Search City',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.paleLilac, // Adjust color as needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    final filteredCities = famousCities.where((city) {
      return city.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    if (filteredCities.isEmpty) {
      return Center(child: Text('No cities found'));
    }

    return ListView.builder(
      itemCount: filteredCities.length,
      itemBuilder: (context, index) {
        final city = filteredCities[index];
        return ListTile(
          title: Text(city,
              style: TextStyle(
                color: AppColors.paleLilac, // Adjust color as needed
              )),
          onTap: () {
            // Navigate to the city weather details screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WeatherDetailScreen(cityName: city),
              ),
            );
          },
        );
      },
    );
  }
}

final List<String> famousCities = [
  'Manila',
  'Cebu',
  'Davao',
  'Quezon City',
  'Zamboanga',
  'Iloilo'
];

class CityWeatherScreen extends StatelessWidget {
  final String city;

  const CityWeatherScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
      ),
      body: Center(
        child: Text('Weather details for $city'),
      ),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.accentPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: AppColors.softLavender,
      ),
    );
  }
}
