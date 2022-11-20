package elastic

import "os"

var Host string

func init() {
	Host = os.Getenv("ELASTICSEARCH_HOST")
	if Host == "" {
		Host = "http://elasticsearch-master:9200"
	}
}
