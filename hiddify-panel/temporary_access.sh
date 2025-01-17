#!/bin/bash
cd $( dirname -- "$0"; )



function main(){
    PORT="${1:-9001}"
    echo "we are openning a port on $PORT"
    iptables -I INPUT -p tcp --dport $PORT -j ACCEPT
    kill $(lsof -t -i:$PORT)
    echo 'kill $(lsof -t -i:'$PORT')'| at now + 4 hour
    echo "iptables -D INPUT -p tcp --dport $PORT -j ACCEPT" | at now + 4 hour

    echo "gunicorn -D --preload -b 0.0.0.0:$PORT 'hiddifypanel:create_app()' " |at now 



}


main $@ |& tee ../log/system/temporary_access.log