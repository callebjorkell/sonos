#!/bin/bash
declare -a arr=("VirtualLineIn" "GroupRenderingControl" "Queue" "AVTransport" "ConnectionManager" "RenderingControl")

for i in "${arr[@]}"
do
    rm -rf ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
    mkdir -p ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
    go run makeservice.go ${i} /MediaRenderer/${i}/Control /MediaRenderer/${i}/Event ${GOPATH}/src/github.com/callebjorkell/sonos/cmd/makeservices/xml/${i}1.xml >${i}.go
    go fmt ${i}.go
    mv ${i}.go ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
done

declare -a arr=("ContentDirectory" "ConnectionManager")

for i in "${arr[@]}"
do
    rm -rf ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
    mkdir -p ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
    go run makeservice.go ${i} /MediaServer/${i}/Control /MediaServer/${i}/Event ${GOPATH}/src/github.com/callebjorkell/sonos/cmd/makeservices/xml/${i}1.xml >${i}.go
    go fmt ${i}.go
    mv ${i}.go ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
done

declare -a arr=("AlarmClock" "MusicServices" "DeviceProperties" "SystemProperties" "ZoneGroupTopology" "GroupManagement" "QPlay")

for i in "${arr[@]}"
do
    rm -rf ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
    mkdir -p ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
    go run makeservice.go ${i} /${i}/Control /${i}/Event ${GOPATH}/src/github.com/callebjorkell/sonos/cmd/makeservices/xml/${i}1.xml >${i}.go
    go fmt ${i}.go
    mv ${i}.go ${GOPATH}/src/github.com/callebjorkell/sonos/${i}/
done