readarray -d '' dir_array < <(find . -type d -name "*-DT" -print0)

$array

for i in ${dir_array[@]}
do
    readarray -d '' array < <(find $i -name "*.svgz" -print0)
done

for i in ${array[@]}
do
    out=${i%.svgz}.pdf
    ~/Write/Write --exit --out $out $i
done