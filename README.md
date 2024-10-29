# Nimbus Notes

## Project Overview
Advanced Mobile Programming project focused on providing essential weather information with a user-friendly interface.

### Team Members
- **Programmer**: John Matthew Banto
- **Documenter**: Gerard Hans M. Misa
- **Designer**: John Paul Dacera

### Instructor
Mr. Cyrus Rj W. Robles

### Key Features

1. **Daily Forecast Screen**: Displays the current day's weather with an option to use location data for accuracy. Shows temperature, wind speed, and humidity with weather-specific imagery.
2. **Top Cities Screen**: Includes a search bar and weather info for six major cities. Tapping a city shows detailed forecasts.
3. **Search City Screen**: Users can search for weather details in selected major cities.
4. **3-Hour Forecast Screen**: Displays short-term, three-hour interval weather data.
5. **Weekly Forecast Screen**: Shows a 7-day forecast with location-based weather info.
6. **To-Do List Screen**: Integrated checklist for typhoon preparedness and other weather-related tasks.

### System Architecture Highlights

- **Models**: Includes classes like `FamousCity`, `Todo`, `Weather`, and `HourlyWeather` to handle city info, to-do items, and weather data across timeframes.
- **Async Programming**: Implements Firebase for data management, with asynchronous functions for API integration and real-time updates.
- **API Integration**: Utilizes Dio for API requests to retrieve current, hourly, and weekly weather data.
- **Geolocation**: Provides user location-based weather data using the Geolocator package.

### Acknowledgments
Special thanks to Mr. Cyrus Rj W. Robles for guidance and feedback.

### Co-Authors
- GodRard (mastergerard@live.com)
- Entropy9901 (enthropy9901@gmail.com)
