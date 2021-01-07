#!/usr/bin/env bash

curl -XPUT "http://localhost:9200/_template/rmoff_01/" \
     -H 'Content-Type: application/json' \
      -d'{
          "template": "train*",
          "settings": {
            "number_of_shards": 1,
            "number_of_replicas": 0
          },
          "mappings": {
            "dynamic_templates": [
              {
                "dates01": {
                  "match": "*_TIMESTAMP",
                  "mapping": {
                    "type": "date",
                    "ignore_malformed": true
                  }
                }
              },
              {
                "geo01": {
                  "match": "GEOHASH",
                  "mapping": {
                    "type": "geo_point"
                  }
                }
              },
              {
                "geo02": {
                  "match": "*_GEOHASH",
                  "mapping": {
                    "type": "geo_point"
                  }
                }
              },
              {
                "numbers": {
                  "match": "TIMETABLE_VARIATION",
                  "mapping": {
                    "type": "short",
                    "ignore_malformed": true
                  }
                }
              },
              {
                "non_analysed_string_template": {
                  "match": "*",
                  "match_mapping_type": "string",
                  "mapping": {
                    "type": "keyword"
                  }
                }
              }
            ]
          }
        }'