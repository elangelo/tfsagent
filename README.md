# tfsagent
docker to run vsts-agent against on premise tfsserver

example command:
to install and run:
{{{docker run -e AGENT="nameofmynewagent" -e TFSURL="http://tfsserver:8080/tfs" -e USERNAME="DOMAIN\TFSBUILDSERVICE" -e PASSWORD="PASSWORDOFTFSBUILDSERVICE" -e POOL="TFSBUILDPOOL" -e "LOCAL_USER_ID=1000" -it elangelo/tfsagent --name firstagent}}}

to remove the agent after killing the container:
{{{docker run -e AGENT="nameofmynewagent" -e TFSURL="http://tfsserver:8080/tfs" -e USERNAME="DOMAIN\TFSBUILDSERVICE" -e PASSWORD="PASSWORDOFTFSBUILDSERVICE" -e POOL="TFSBUILDPOOL" -e "LOCAL_USER_ID=1000" -it elangelo/tfsagent remove}}}
