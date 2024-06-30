#!/bin/bash

function countWords {
  filename="$1"

  if [ ! -f "$filename" ]; then
    echo "wordCount.sh: $filename: Not a file"
    exit 1
  fi

  unique_words=()
  word_counts=()

  while read -r line; do
    line=$(echo "$line" | tr '[:upper:]' '[:lower:]')
    words_in_line=($(echo "$line" | tr -cs '[:alpha:]' ' '))
    for word in "${words_in_line[@]}"; do
      if [[ -n "$word" ]]; then
        index=-1
        for i in "${!unique_words[@]}"; do
          if [[ "${unique_words[$i]}" = "$word" ]]; then
            index=$i
            break
          fi
        done
        if [[ "$index" -ne -1 ]]; then
          word_counts[$index]=$((word_counts[$index]+1))
        else
          unique_words+=("$word")
          word_counts+=("1")
        fi
      fi
    done
  done < "$filename"
}

if [ "$#" -ne 1 ]; then
  echo "usage: wordCount.sh <filename>"
  exit 1
fi

countWords "$1"

echo "RESULTS"
echo "=================================================="

for i in "${!unique_words[@]}"; do
  word=${unique_words[$i]}
  count=${word_counts[$i]}
  case $count in
    1)
      echo "'$word' occurs 1 time."
      ;;
    [2-4])
      echo "'$word' occurs $count times."
      ;;
    *)
      echo "'$word' occurs $count times. WARNING!"
      ;;
  esac
done
