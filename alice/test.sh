echo ============ message app ,================== functions:
echo
echo -- gen [my username]: generates public + private RSA KEYS 
echo -- open [my usr] [con pwd] [destination usr] gen then try setting secured 
echo -- accept [me] [destination usr] accept connection if secured
echo -- send [from] [to] [msg] : sends message
echo -- "read [from]  :reads message"
echo -- reset : deletes all communication and rsa keys
echo
read var var2 var3 var4
echo $var

while [ $var != 'exit' ]
do
	
	if [ $var = 'gen' ]
	then 
		./script.sh $var2
	fi
	if [ $var = 'open' ]
	then 
		./script_key_setter.sh $var2 $var3 $var4
	fi
	if [ $var = 'accept' ]
	then 
		./script_open.sh $var2 $var3
	fi
	if [ $var = 'read' ]
	then 
		./read.sh $var2
	fi
	if [ $var = 'send' ]
	then 
		./send.sh $var2 $var3 $var4
	fi
	if [ $var = 'reset' ]
	then 
		rm *.dgst *.txt *.pem *.sign *.crypt
		clear
		echo ============ message app ,================== functions:
			echo
		echo -- gen [my username]: generates public + private RSA KEYS 
		echo -- open [my usr] [con pwd] [destination usr] gen then try setting secured 
		echo -- accept [me] [destination usr] accept connection if secured
		echo -- send [from] [to] [msg] : sends message
		echo -- "read [from]  :reads message"
		echo -- reset : deletes all communication and rsa keys
		echo
	fi
echo
read var var2 var3 var4
done