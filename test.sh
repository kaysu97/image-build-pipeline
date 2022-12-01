filename='base_image_list.txt'
IFS='-'
while read image_tag || [ -n "$image_tag" ]; do
    read -a strarr <<< "$image_tag"
    len=$((${#strarr[*]}-3))
    sep_arr=${strarr[*]:2:len}
    file_name=`echo "$sep_arr" | sed 's/ /-/g'`
    dockerfile="$file_name.Dockerfile"
    echo "$dockerfile"
    airflow_tag=`echo ${strarr[*]::2} | sed 's/ /-/g'`
    echo "$airflow_tag"
done < $filename
