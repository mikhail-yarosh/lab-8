package main

import (
	"encoding/json"
	"log"
	"text/template"

	"net/http"
)

// All controllers functions name should be started from C/controllers

// controllerGetWeather is for weather requests
func controllerGetWeather(w http.ResponseWriter, r *http.Request) {
	weather := WeatherStruct{}

	// Get weather from weather portal
	getWeather(&weather)

	// Render template using values from weather portal
	t, err := template.ParseFiles("views/weather.html.tmpl")
	if err != nil {
		log.Println(err.Error())
	}
	t.Execute(w, weather)

	// Set Content-type according to task
	w.Header().Add("Content-Type", "text/html")
}

// controllerHealth is function for the service healthchecks
func controllerHealth(w http.ResponseWriter, r *http.Request) {

	// Dedicated function makes data for response
	health, _ := json.Marshal(health())

	// Set content type according to task
	w.Header().Add("Content-Type", "application/json")
	w.Write([]byte(health))
}

// controllerPing is for ping requests
func controllerPing(w http.ResponseWriter, r *http.Request) {
	health := "PONG"

	// Set content type according to task
	w.Header().Add("Content-Type", "text/html")
	w.Write([]byte(health))
}
