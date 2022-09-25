#!/bin/bash # New recon machine all-in-one setup (post go-install)
# MUST have GO installed and configured! Will add upon revision
echo "Now installing Go programs for recon and bug-bounty!"
sleep 1

# Project Discovery and Tomnomnom stuff...

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sleep 1
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sleep 1
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
sleep 1
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
sleep 1
go install -v github.com/tomnomnom/waybackurls@latest
sleep 1
go install -v github.com/tomnomnom/anew@latest
sleep 1
go install -v github.com/tomnomnom/gf@latest
sleep 1
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
sleep 1
go install github.com/tomnomnom/httprobe@latest
sleep 1
go install github.com/tomnomnom/unfurl@latest
sleep 1
go install github.com/lc/gau/v2/cmd/gau@latest
sleep 1

# Docker & Compose

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# SQLi & XSS scanners

go install github.com/hahwul/dalfox/v2@latest
sleep 1

sudo docker build -t scant3r https://github.com/knassar702/scant3r.git
# alias scant3r="sudo docker run -it scant3r -h"

# Lists Installation 

mkdir lists
cd lists
git clone https://github.com/danielmiessler/SecLists.git
cd ..
mkdir payloads
cd payloads
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
cd ..
