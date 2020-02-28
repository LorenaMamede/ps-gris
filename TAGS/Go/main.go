package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"
)

func ScanPorts(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	ip := params["ip"]
	portainicio, _ := strconv.Atoi(params["portainicio"])
	portafim, _ := strconv.Atoi(params["portafim"])

	for port := portainicio; port < portafim+1; port++ {
		host := fmt.Sprintf("%s:%d", ip, port)
		_, err := net.DialTimeout("tcp", host, 1*time.Second)
		if err == nil {
			json.NewEncoder(w).Encode(strconv.Itoa(port) + " - dial tcp " + host + ": open")
		} else {
			json.NewEncoder(w).Encode(strconv.Itoa(port) + " - " + err.Error())
		}
	}
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/{ip}/{portainicio}/{portafim}", ScanPorts).Methods("GET")
	log.Fatal(http.ListenAndServe(":8080", router))
}
