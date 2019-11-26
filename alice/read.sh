openssl enc -in message.crypt -out message.txt -pass file:des_key.txt -d -des-cbc
openssl dgst -md5 -binary -out message_v1.txt.dgst message.txt
openssl rsautl -in message.txt.dgst.sign -out message_v2.txt.dgst -pubin -inkey ../public_keys/$1_public.pem
HACH_v1=$(<message_v1.txt.dgst) 
HACH_v2=$(<message_v2.txt.dgst) 
echo "comparing hached messages "
echo $HACH_v1 avec $HACH_v2
if [ $HACH_v1 = $HACH_v2 ]
then
        echo "message sent fro $1"
	cat message.txt 
	
else
        echo "message non signé correctement"
fi