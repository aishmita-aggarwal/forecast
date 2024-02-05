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
  data: {
    coordinates: {
      lon: Longitude of the location
      lat: Latitude of the location
    },
    temperature: {
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
    rain: {
      1h: (where available) Rain volume for the last 1 hour, mm. Please note that only mm as units of measurement are available for this parameter,
      3h: (where available) Rain volume for the last 3 hours, mm. Please note that only mm as units of measurement are available for this parameter
    },
    snow: {
      1h: (where available) Snow volume for the last 1 hour, mm. Please note that only mm as units of measurement are available for this parameter,
      3h: (where available)Snow volume for the last 3 hours, mm. Please note that only mm as units of measurement are available for this parameter
    },
    sunrise: Sunrise time, unix, UTC,
    sunset: Sunset time, unix, UTC
  }
}
```
**Example:**
```
{base}/api/v1/weather?city_name=delhi
```
```
{
    "data": {
        "coordinates": {
            "lon": 77.2167,
            "lat": 28.6667
        },
        "temperature": {
            "temp": 68.09,
            "feels_like": 67.05,
            "temp_min": 68.09,
            "temp_max": 68.09,
            "pressure": 1017,
            "humidity": 52
        },
        "visibility": 3500,
        "wind": {
            "speed": 8.05,
            "deg": 300
        },
        "rain": null,
        "snow": null,
        "sunrise": 1707097051,
        "sunset": 1707136355
    }
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