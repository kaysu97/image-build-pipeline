image_tag='airflow:2.4.3-python3.7-base-v1'

# str=$(echo "airflow:2.4.3-python3.7-base-v1" | sed 's/-/ /g')
# echo $str
strarr=($(echo "$image_tag" | sed 's/-/ /g'))
echo "${strarr[*]}"
# len=$((${#strarr[*]}-3))
# sep_arr=${strarr[*]:2:len}
# file_name=`echo "$sep_arr" | sed 's/ /-/g'`
# dockerfile="Dockerfile.$file_name"
# echo "dockerfile name: $dockerfile"
# airflow_tag=`echo ${strarr[*]::2} | sed 's/ /-/g'`
# echo "airflow tag: $airflow_tag"
# echo "image tag: $image_tag"
python_version=${strarr[1]}
echo $python_version


