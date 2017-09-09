#!binbash

read -p Insira a URL VAR_URL_TARGET
read -p Insira o nome do arquivo VAR_FILE_NAME

echo -e e[1;32mSalvando cópia da pagina...e[0m

wget -O $VAR_FILE_NAME $VAR_URL_TARGET

echo -e e[1;32mArquivo salvo...e[0m
echo -e e[1;32mTratando dados...e[0m

cat $VAR_FILE_NAME  grep -Eoi 'a [^]+'  grep -Eo 'href=[^]+'  grep -Eo '(httphttps)[^]+'  URL_LIST.txt

echo -e e[1;32mURLs exportadas para URL_LIST.txte[0m

cat $VAR_FILE_NAME  grep -oE b([0-9]{1,3}.){3}[0-9]{1,3}b  IP_LIST.txt

echo Endereços IP copiados para IP_LIST.txt


echo -e e[1;32mIniciando scan de portas...e[0m

nmap -v -Pn -p 21,23,22,8080,1433,3306 -iL IP_LIST.txt  NMAP_SCAN_RAW.txt

echo -e e[1;32mDados do scan de portas exportado para
NMAP_SCAN_RAW.txte[0m

echo -e e[1;32mTratando dados...e[0m

cat NMAP_SCAN_RAW.txt  grep open  OPEN_PORTS.txt

mkdir wipvul
mv .txt wipvul


echo -e e[1;32mFINALIZADO.e[0m

exit
