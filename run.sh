docker-compose up -d
docker-compose ps
docker-compose exec db psql -U postgres -f /scripts/check.sql