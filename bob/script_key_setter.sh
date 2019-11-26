openssl genrsa -out $1_private.pem -passout pass:t_password -des 512
openssl rsa -in $1_private.pem -passin pass:t_password -out $1_public.pem -pubout
cp ./$1_public.pem ../public_keys
touch des_key.txt
echo $2 > des_key.txt
openssl rsautl -in des_key.txt -out ../$3/des_key.crypt -inkey ../public_keys/$3_public.pem -pubin -encrypt
#cp des_key.crypt ../$3
openssl dgst -md5 -binary -out des_key.txt.dgst des_key.txt
openssl rsautl -in des_key.txt.dgst -out ../$3/des_key.txt.dgst.sign -sign -inkey $1_private.pem -passin pass:t_password