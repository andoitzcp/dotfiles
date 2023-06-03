#!/bin/bash

while getopts "lm:rw:" OPTION; do
	case $OPTION in
		l)
			awk '{print $1, $2}'	index | column -t
			;;
		m)
			MANGA=$OPTARG
			;;
		r)
			ID=$(awk -v var="$MANGA" '$1 == var {print $2 ;}' index)
			echo $ID
			NAME=$(awk -v var="$MANGA" '$1 == var {print $3 ;}' index)
			LAST_CHAPTER=$(($(grep $MANGA bookmark | tail -n 1 | awk -F"," '{ print $2 }' | tr -d '\n') + 1))
			DIGITS=$(echo $LAST_CHAPTER | wc -c)
			if [ $DIGITS = 2 ]
			then
				FLAG="000"
			elif [ $DIGITS = 3 ]
			then
				FLAG="00"
			elif [ $DIGITS = 4 ]
			then
				FLAG="0"
			else
				FLAG="1"
			fi
			URL="https://mangapill.com/chapters/"$ID"-1"$FLAG""$LAST_CHAPTER"000/"NAME"-$LAST_CHAPTER"
			firefox --new-window $URL
			;;
		w)
			DATE=$(date --iso-8601)
			CHAPTER=$OPTARG
			awk -v d="$DATE" -v c="$CHAPTER" -v m="$MANGA" 'BEGIN {print d "," c "," m}' >> bookmark
			;;
		?)
			echo "script usage: $(manga.sh \$0)[-m target manga] [-r] [-w last read chapter + 1]" >&2
			exit 1
			;;
	esac
done
shift "$(($OPTIND -1))"
