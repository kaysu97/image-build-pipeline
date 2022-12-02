# filename='base_image_list.txt'
# # IFS='-'
# image_list="["
# while read image_tag || [ -n "$image_tag" ]; do
#     image_list="$image_list$image_tag, "
#     # len=$((${#strarr[*]}-3))
#     # sep_arr=${strarr[*]:2:len}
#     # file_name=`echo "$sep_arr" | sed 's/ /-/g'`
#     # dockerfile="Dockerfile.$file_name"
#     # echo "dockerfile name: $dockerfile"
#     # airflow_tag=`echo ${strarr[*]::2} | sed 's/ /-/g'`
#     # echo "airflow tag: $airflow_tag"
#     # echo "image tag: $image_tag"
#     # docker build . -f "$dockerfile" -t "coolcool97"/"$image_tag" --build-arg AIRFLOW_IMAGE_TAG="$airflow_tag"
#     # # docker push $IMAGE_REGISTRY/$image_tag
# done < $filename


IFS='-'
read -a strarr <<< "airflow:2.4.3-python3.8-slim-base-v1"
echo "airflow:2.4.3-python3.8-slim-base-v1"
len=$((${#strarr[*]}-3))
sep_arr=${strarr[*]:2:len}
file_name=$(echo "$sep_arr" | sed 's/ /-/g')
dockerfile=Dockerfile.$file_name
echo "action_state=yellow" >> $GITHUB_ENV
# echo "dockerfile name: $dockerfile"
# echo "airflow_tag=$(echo ${strarr[*]::2} | sed 's/ /-/g')" >> $GITHUB_ENV
# echo "airflow tag: $airflow_tag"
# echo "image tag: airflow:2.4.3-python3.8-slim-base-v1"