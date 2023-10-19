taglist="$( docker images $1 | awk '{print $2}' | sed '1d' )"

visited=0
for tag in $taglist
do
        createdTime="$( docker inspect -f '{{ .Created }}' $1:$tag )"
        formatedCT=$(date -d "$createdTime" +"%Y%m%d%H%M%S")
        if [ $visited -eq 0 ]; then
                greatestValue=$formatedCT
                visited=1
        fi

        if [ $formatedCT -ge $greatestValue ]; then
                greatestValue=$formatedCT
                latestTag=$tag
        fi
done

imageId=$(docker images $1:$latestTag | awk '{print $3}' | sed '1d')
echo $imageId
