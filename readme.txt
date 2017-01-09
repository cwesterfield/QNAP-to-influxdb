These two scripts login to a QNAP @ 10.0.1.200 and pull info using du.

The NAS script formats the output from the QNAP into an influxdb importable file, and then imports it into a database named "QNAP."

I run these scripts on my graphana/influxdb instance.