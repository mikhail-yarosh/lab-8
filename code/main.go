package main

import (
	"log"
	"net/http"

	// Well-known middleware
	"github.com/gorilla/mux"
)

func main() {

	// Initialize router
	r := mux.NewRouter()

	r.HandleFunc("/", controllerGetWeather)
	r.HandleFunc("/ping", controllerPing)
	r.HandleFunc("/health", controllerHealth)

	// Bind to a port and pass our router in
	log.Fatal(http.ListenAndServe(":8080", r))
}
