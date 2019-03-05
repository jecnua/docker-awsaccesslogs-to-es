#

    No persistent UUID file found. Generating new UUID {:uuid=>"d5fc0e74-286f-466e-8075-3cadc061ae4e", :path=>"/usr/share/logstash/data/uuid"}

      xpack.monitoring.enabled has not been defined, but found elasticsearch configuration. Please explicitly set `xpack.monitoring.enabled: true` in logstash.yml


      output {
          stdout { codec => rubydebug }
      }
