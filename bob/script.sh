openssl genrsa -out $1_private.pem -passout pass:t_password -des 512
openssl rsa -in $1_private.pem -passin pass:t_password -out $1_public.pem -pubout
cp ./$1_public.pem ../public_keys


