#!/bin/bash 
echo "$1"

USER_ID=${LOCAL_USER_ID:-9001}

echo "starting with UUID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user

cd /myagent

case "$1" in
  install)
    gosu $USER_ID ./config.sh --unattended --acceptteeeula --replace --url ${TFSURL} --auth Negotiate --username ${USERNAME} --password ${PASSWORD} --pool ${POOL} --agent ${AGENT};
    gosu $USER_ID ./run.sh;
    ;;
  remove)
    gosu $USER_ID ./config.sh --unattended --acceptteeeula --replace --url ${TFSURL} --auth Negotiate --username ${USERNAME} --password ${PASSWORD} --pool ${POOL} --agent ${AGENT};
    gosu $USER_ID ./config.sh remove --auth Negotiate --username ${USERNAME} --password ${PASSWORD};
    ;;
  *)
    echo "none of the above"
    exec "$@"
esac
