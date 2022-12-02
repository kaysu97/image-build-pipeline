filename='base_image_list.txt'
IFS='-'
while read image_tag || [ -n "$image_tag" ]; do
    read -a strarr <<< "$image_tag"
    len=$((${#strarr[*]}-3))
    sep_arr=${strarr[*]:2:len}
    file_name=`echo "$sep_arr" | sed 's/ /-/g'`
    dockerfile="Dockerfile.$file_name"
    echo "$dockerfile"
    airflow_tag=`echo ${strarr[*]::2} | sed 's/ /-/g'`
    echo "$airflow_tag"
    docker build . -f "Dockerfile.base" -t coolcol97/"$image_tag" --build-arg AIRFLOW_IMAGE_TAG="$airflow_tag"
# docker push $IMAGE_REGISTRY:$image_tag
done < $filename