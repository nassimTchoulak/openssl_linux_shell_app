openssl rsautl -decrypt -in des_key.crypt -out des_key.txt -inkey $1_private.pem -passin pass:t_password
openssl dgst -md5 -binary -out des_key_v1.txt.dgst des_key.txt
openssl rsautl -in des_key.txt.dgst.sign -out des_key_v2.txt.dgst -pubin -inkey ../public_keys/$2_public.pem
HACH_v1=$(<des_key_v1.txt.dgst) 
HACH_v2=$(<des_key_v2.txt.dgst) 
echo "comparing hached keys "
echo $HACH_v1 avec $HACH_v2
if [ $HACH_v1 = $HACH_v2 ]
then
        echo "$1 authentifié avec $2 msg is on"
else
        echo "lien refusé + clé des supprimé"
	rm des_key.txt
fi