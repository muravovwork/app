DIRECTORY=`dirname $0`

MYSQL_ROOT_PASSWORD=$(grep MYSQL_ROOT_PASSWORD $DIRECTORY"/.env" | xargs)
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD#*=}

db() {
  docker-compose exec mysql mysql -uroot -p${MYSQL_ROOT_PASSWORD}
}

up() {
  down
  build
  docker-compose up -d
}

down() {
  docker-compose down
}

build() {
  docker-compose build
}

case "$1" in
  "up")
    up;;
  "db")
      db;;
  "build")
      build;;
  "down")
      down;;
esac