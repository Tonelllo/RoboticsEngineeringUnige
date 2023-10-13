readarray -d '' dir_array < <(find . -type d -name "*-DT" -print0)

for i in ${dir_array[@]}
do
    echo "found DT directory "  $i
    readarray -d '' array < <(find $i -name "*.svgz" -print0)
    for j in ${array[@]}
    do
        echo "processing " $j
        out=${i%.svgz}.pdfa
        out1=${out#./}
        ./Write/Write --exit --out $out1 $j
    done
done
ls ./Year_1/First_semester/MCM/MCM-DT/
