package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	// handle route using handler function
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		secretKey := os.Getenv("SECRET_KEY")
		apiKey := os.Getenv("API_KEY")
		fmt.Fprintf(w, "Welcome to new server! "+secretKey+"- API KEY - "+apiKey+".")
	})

	// listen to port
	http.ListenAndServe(":5050", nil)
}
