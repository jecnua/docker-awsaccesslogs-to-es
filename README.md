# AWS access logs to elasticsearch - WIP

s3 access log files to elasticsearch via logstash

    No persistent UUID file found. Generating new UUID {:uuid=>"d5fc0e74-286f-466e-8075-3cadc061ae4e", :path=>"/usr/share/logstash/data/uuid"}

      xpack.monitoring.enabled has not been defined, but found elasticsearch configuration. Please explicitly set `xpack.monitoring.enabled: true` in logstash.yml


      output {
          stdout { codec => rubydebug }
      }


##

You could remove the field:

    if [type] == "ELB_ACCESS_LOG" {
        grok {
            patterns_dir => ["/etc/logstash/conf.d/patterns"]
            match        => { "message" => "%{ELB_ACCESS_LOG}" }
            remove_field => ["message"]
        }
        date {
            match        => [ "timestamp" , "dd/MMM/yyyy:HH:mm:ss Z" ]
            remove_field => ["timestamp"]
        }
    }

But I prefer to keep it
