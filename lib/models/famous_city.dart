class FamousCity {
  final String name;
  final double lat;
  final double lon;

  const FamousCity({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

// List of famous cities in the Philippines as a constant
List<FamousCity> famousCities = const [
  FamousCity(name: 'Manila', lat: 14.5995, lon: 120.9842),
  FamousCity(name: 'Cebu City', lat: 10.3119, lon: 123.8854),
  FamousCity(name: 'Davao City', lat: 7.1907, lon: 125.4553),
  FamousCity(name: 'Quezon City', lat: 14.6760, lon: 121.0437),
  FamousCity(name: 'Zamboanga City', lat: 6.9075, lon: 122.0734),
  FamousCity(name: 'Iloilo City', lat: 10.6918, lon: 122.5621),
];
