package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

func ScanPorts(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	ip := params["ip"]
	portainicio, _ := strconv.Atoi(params["portainicio"])
	portafim, _ := strconv.Atoi(params["portafim"])

	for port := portainicio; port < portafim+1; port++ {
		host := fmt.Sprintf("%s:%d", ip, port)
		json.NewEncoder(w).Encode(host)
		_, err := net.Dial("tcp", host)
		if err == nil {
			json.NewEncoder(w).Encode(strconv.Itoa(port) + " - open")
		} else {
			json.NewEncoder(w).Encode(strconv.Itoa(port) + " - " + err.Error())
		}
	}
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/{ip}/{portainicio}/{portafim}", ScanPorts).Methods("POST")
	log.Fatal(http.ListenAndServe(":8080", router))
}
