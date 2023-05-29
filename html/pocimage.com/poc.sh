#!/bin/bash
git clone https://github.com/nomi-sec/PoC-in-GitHub.git &> /dev/null 
git pull origin HEAD &> /dev/null
echo -n > list_out
list=$(for cve in $(cat list_in); do find PoC-in-GitHub/ -name "$cve.json"; done)
        for cve in $list; do cat $cve | jq | grep html_url | grep CVE | sed -e 's/html_url//' -e 's/://' -e 's/"//g' -e 's/,//g' -e 's/ //g' | sed 's/ /\n/g' >> list_out; done
        echo -n > list_in
