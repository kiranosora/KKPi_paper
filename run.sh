#!/bin/bash
STAT=1
VER="0.0"
PAT="[0-9].[0-9]"
while [[ $STAT -eq 1 ]]
do
    echo "please input version: "
    read VER 
    echo "VER: $VER"
    if [[ $VER =~ $PAT ]]
    then
        STAT=0
        echo "STAT: $STAT"
    fi
    echo "please input msg: "
    read MSG
done
pdflatex bes3memo.tex
mv bes3memo.pdf PDF/Ds2KKPi_v${VER}.pdf
echo "destination:  PDF/Ds2KKPi_v${VER}.pdf"
NEW_TAG=`git tag|grep "v${VER}"`
PAT2="v${VER}"
if [[ -z $NEW_TAG || $NEW_TAG != $PAT2 ]]
then
    cd ..
    git commit -a -m $MSG
    git tag -a $PAT2 -m $MSG
    git push -u origin master
else
    echo "existed tag: $NEW_TAG"
    echo "Are you sure to force to push? "
    read ANS
    if [[ $ANS = "Y" ]]
    then
        cd ..
        git commit -a -m "$MSG"
        git tag -a $PAT2 -m "$MSG"
        git push -f -u origin master
    fi
fi


