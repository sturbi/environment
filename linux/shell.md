


cat /var/log/squid/access.log | perl -p -e 's/^([0-9]*)/"[".localtime($1)."]"/e'


