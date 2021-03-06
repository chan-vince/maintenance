package main

import (
	"log"
	"net/http"
)

func main() {
	log.Println("Listening on port 3000...")
	http.HandleFunc("/", getMaintenancePage)
	http.ListenAndServe(":3000", nil)
}

func getMaintenancePage(res http.ResponseWriter, req *http.Request) {
	http.ServeFile(res, req, "/static/index.html")
}