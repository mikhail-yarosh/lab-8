package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)

// health setting simple slice of string to show the middleware acting normally
func health() (status []string) {
	status = append(status, "200", "ok")
	return
}

// getWeather make requests to weather portal and parse the body response into custom structure type
func getWeather(weather *WeatherStruct) {
	// Useful sample of data for debug
	// response := `{"coord":{"lon":37.6067,"lat":55.7617},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"base":"stations","main":{"temp":11.05,"feels_like":9.05,"temp_min":11,"temp_max":11.11,"pressure":1022,"humidity":32},"visibility":10000,"wind":{"speed":6,"deg":170},"clouds":{"all":0},"dt":1618061479,"sys":{"type":1,"id":9027,"country":"RU","sunrise":1618022218,"sunset":1618071861},"timezone":10800,"id":524894,"name":"Moscow","cod":200}`

	// Get weather portal' api key from environment variables (easy and cheap, can do that each time we get a request, but could be moved into init section and passed as a function parameter)
	apikey := os.Getenv("API_KEY")
	response, err := http.Get("https://api.openweathermap.org/data/2.5/weather?id=524894&appid=" + apikey + "&units=metric")
	if err != nil {
		log.Fatalln(err)
	}

	// Now we have a response, let's check it useful
	weatherBody, bodyErr := ioutil.ReadAll(response.Body)
	if bodyErr != nil {
		log.Println("Err body from openweathermap ", bodyErr.Error())
	}

	// Get the payload into json object
	var result map[string]interface{}
	json.Unmarshal([]byte(weatherBody), &result)

	// Better to get logs about each response to collect statistics about the response content types
	log.Println(result)

	// ToDo: the block could be replaced by function
	// The name is useless this time, but only this :)
	weatherWeather := result["weather"].([]interface{})

	// Get sky information
	weatherMap := weatherWeather[0].(map[string]interface{})
	weather.Main = weatherMap["main"].(string)

	// Get temperature information
	weatherTemp := result["main"].(map[string]interface{})
	weather.Temp = weatherTemp["temp"].(float64)

	// Get visibility information
	weather.Visibility = result["visibility"].(float64)

	// Get wind information
	weatherWind := result["wind"].(map[string]interface{})
	weather.Wind = weatherWind["speed"].(float64)

	// Print result of parsing into stdout
	log.Println(weather)
}
