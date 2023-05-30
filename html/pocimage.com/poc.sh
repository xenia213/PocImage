#!/bin/bash
list_in=/var/www/pocimage.com/list_in
list_out=/var/www/pocimage.com/list_out
poc_dir=/var/www/pocimage.com/PoC-in-GitHub/
git clone https://github.com/nomi-sec/PoC-in-GitHub.git &> /dev/null 
git config --global --add safe.directory /var/www/pocimage.com/PoC-in-GitHub &> /dev/null
cd /var/www/pocimage.com/PoC-in-GitHub && git pull origin HEAD &> /dev/null
echo -n > $list_out
sed -i -e 's/\r//g' $list_in
list=$(for cve in $(cat $list_in); do find $poc_dir -name "$cve.json"; done)
        for cve in $list; do jq 'del(.[] | .owner | .html_url)' $cve | grep html_url | sed -e 's/[", ]//g' -e 's/html_url://g' >> $list_out; done
        echo -n > $list_in
