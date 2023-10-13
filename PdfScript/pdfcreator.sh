readarray -d '' dir_array < <(find . -type d -name "*-DT" -print0)

$array
ls ~
for i in ${dir_array[@]}
do
    echo "found DT directory "  $i
    readarray -d '' array < <(find $i -name "*.svgz" -print0)
done

for i in ${array[@]}
do
    echo "processing " $i
    out=${i%.svgz}.pdf
    out1=../../${out#./}
    ../../Write/Write --exit --out $out1 $i
done
