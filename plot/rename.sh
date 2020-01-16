for FILE in `ls MIPPWA*`
do
    FILE1=${FILE/MIPPWA/MIPWA}
    echo $FILE1
    mv $FILE $FILE1

done
