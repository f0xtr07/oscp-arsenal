for host in $(cat ip.txt):
do echo $host && curl -k http://$host/
done
