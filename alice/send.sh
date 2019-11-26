echo "$1:$3" >> message.txt
openssl enc -des-cbc -in message.txt -out ../$2/message.crypt -pass file:des_key.txt
openssl dgst -md5 -binary -out message.txt.dgst message.txt
openssl rsautl -in message.txt.dgst -out ../$2/message.txt.dgst.sign -sign -inkey $1_private.pem -passin pass:t_password
rm message.txt.dgst