
services=(
    "kong"
    "npg-mongo-db"
    "go-finance-service"

)


EXCLUDE=$1
SERVICE=$2
CURR_DIR=$PWD


runServices() {
  sleep 10
  chmod +x ./bin/runServices.sh

  echo 'Run Setup ....'
  ./bin/runServices.sh
}




if [ -n  "$1" ]; then
  
  
  if [ "${1}" = 'exclude' ]; then
    echo "Running Exclude Command."
    echo 'Tear down docker compose....'
   
    docker-compose down
   
    if [ -n "$2" ]; then


      echo " excluding ${2}..."
      for service in "${services[@]}"; do
        if [ "${service%%:*}" != "${SERVICE}" ]; then
          echo "Running ${service}"
          docker-compose -f ${CURR_DIR}/../docker-compose.yaml build ${service#*:}
          docker-compose up -d ${service#*:}
        fi
      done

      runServices
     
    fi

  elif [ "${1}" = 'up' ]; then
    echo "Running Start Command"
    if [ -n "$2" ]; then
      if [ "${2}" = 'all' ]; then
        docker-compose up -d 
      else   
        docker-compose kill ${2}
        # docker-compose -f ${CURR_DIR}/../docker-compose.yaml build ${2}
        docker-compose up -d ${2}
      fi
    fi

  
  elif [ "${1}" = 'down' ]; then
    echo "Running Stop Command"
    if [ -n "$2" ]; then
      docker-compose kill ${2}
    fi
  fi
else
  echo 'Rebuilding docker compose...'
   
  docker-compose down
 
  docker-compose up -d

  runServices 

fi





echo 'Dev environment is ready ...'