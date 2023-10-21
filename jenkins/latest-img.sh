TOKEN=$(wget -q -O - "https://hub.docker.com/v2/repositories/dhub2000/img/tags?page_size=100")

tag=$(echo $TOKEN | jq --raw-output '.results[0].name')

echo $tag
