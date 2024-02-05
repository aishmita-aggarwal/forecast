# Forecast

## Overview:
```
This App is a simple Ruby on Rails API Application that provides a public API to fetch weather data of a City (e.g., temperature, humidity, wind speed).
It uses the OpenWeatherMap public weather API to gather weather information.
```
**Weather API:**

**Request:**
```
Method |  URL                        | Params
  Get  | {base}/api/v1/weather       | city_name(string)
```
**Example:**
```
{base}/api/v1/weather?city_name=delhi
```
**Response:**

**1. Success**
```
  Status code: 200
Response body: {
  coord: {
    lon: Longitude of the location
    lat: Latitude of the location
  },
  weather: {
    id: Weather condition id,
    main: Group of weather parameters (Rain, Snow, Clouds etc.),
    description: Weather condition within the group,
    icon: Weather icon id
  },
  base: internal parameter of OpenWeatherMap,
  main: {
    temp: Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit,
    feels_like: Temperature. This temperature parameter accounts for the human perception of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit,
    pressure: Atmospheric pressure on the sea level, hPa,
    humidity: Humidity, %,
    temp_min: Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas). Please find more info here. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit,
    temp_max: Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas). Please find more info here. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit,
    sea_level:  Atmospheric pressure on the sea level, hPa,
    grnd_level: Atmospheric pressure on the ground level, hPa
  },
  visibility: Visibility, meter. The maximum value of the visibility is 10 km,
  wind: {
    speed: Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour,
    deg: Wind direction, degrees (meteorological),
    gust: Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  },
  clouds: {
    all: Cloudiness, %
  },
  rain: {
    1h: (where available) Rain volume for the last 1 hour, mm. Please note that only mm as units of measurement are available for this parameter,
    3h: (where available) Rain volume for the last 3 hours, mm. Please note that only mm as units of measurement are available for this parameter
  },
  snow: {
    1h: (where available) Snow volume for the last 1 hour, mm. Please note that only mm as units of measurement are available for this parameter,
    3h: (where available)Snow volume for the last 3 hours, mm. Please note that only mm as units of measurement are available for this parameter
  },
  dt: Time of data calculation, unix, UTC,
  sys: {
    type: internal parameter of OpenWeatherMap,
    id: internal parameter of OpenWeatherMap,
    message: internal parameter of OpenWeatherMap,
    country: Country code (GB, JP etc.),
    sunrise: Sunrise time, unix, UTC,
    sunset: Sunset time, unix, UTC
  },
  timezone: Shift in seconds from UTC,
  id: City ID,
  name: City name,
  cod: internal parameter of OpenWeatherMap
}
```
**Example:**
```
{base}/api/v1/weather?city_name=delhi
```
```
{
    "coord": {
        "lon": 77.2167,
        "lat": 28.6667
    },
    "weather": [
        {
            "id": 721,
            "main": "Haze",
            "description": "haze",
            "icon": "50d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 68.11,
        "feels_like": 67.06,
        "temp_min": 68.09,
        "temp_max": 68.11,
        "pressure": 1018,
        "humidity": 52
    },
    "visibility": 1800,
    "wind": {
        "speed": 5.75,
        "deg": 200
    },
    "clouds": {
        "all": 0
    },
    "dt": 1706516458,
    "sys": {
        "type": 2,
        "id": 145989,
        "country": "IN",
        "sunrise": 1706492473,
        "sunset": 1706531206
    },
    "timezone": 19800,
    "id": 1273294,
    "name": "Delhi",
    "cod": 200
}
```
**2. Not Found**
```
  Status code: 404
Response body: {
  message: String
}
```
**example:**
```
{base}/api/v1/weather?city_name=
```
```
{ "message": "City not found" }
```
## Improvements Needed
```
1. Add test cases
  Adding unit and functional test cases for the application will improve code quality and code resilience.
2. Update/Extend API:
  a. Update API to fetch only required weather data:
    The OpenWeatherMap API returns much data under weather conditions which might not be needed most of the times. For example, we might just need the Latitude, Longitude and temperature for displaying a certain city's weather.
    On another occasion, we might just need to fetch the sunrise and sunset timings in an application.
    So, providing a way to be selective about the data required can reduce the data being fetched.
  b. Split/Add more API:
    The above approach can also be achieved by adding other APIs like /latlon, /temperature, /windspec, /sunrise, /sunset.
3. Add in code documentation:
  Adding in code documentation about the methods and classes provides a fellow developer insight and ease of understanding.
```
## Setup

### Requirements
```
* Ruby - 3.3.0
* Rails - 6.0.6
```
### Clone the repository
```
  To clone the repository, run

  git clone https://github.com/aishmita-aggarwal/forecast.git

  This will create a directory of the name 'forecast' in your current directory. To go into the directory, run

  cd forecast

```
### Add the following files to /config folder having appropriate api keys and/or credentials
```
  Add config/master.key and ask your administrator to provide you with this key. Paste it in this file.

  Once done, running `EDITOR=vim rails credentials:edit` will show you the credentials saved.

```
### Install required gems
```
  bundle install
```
### Setup and Install Signoz for OTEL monitoring
```
  Signoz is the Observability Backend used. To run the following, you will need to have Docker installed on your system. Once Docker is added, in the parent directory, run the following commands. 

  git clone -b main https://github.com/SigNoz/signoz.git

  cd signoz/deploy/

  ./install.sh
```
### Start rails server
```
  OTEL_EXPORTER=otlp OTEL_SERVICE_NAME=forecast OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4318 OTEL_RESOURCE_ATTRIBUTES=application=forecast rails server

  Now the app should be running at http://localhost:3000/

  You may hit the weather API to start fetching weather data.

  And navigate to http://localhost:3301/application (needs signup) to analyse the telemetry data of the application.
```