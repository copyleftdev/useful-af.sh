# Search for a pattern in files recursively, ignoring case
# Usage: my_grep 'pattern' /path/to/folder
my_grep() {
  grep -r -i "$1" "$2"
}

# Count occurrences of a word in a file
# Usage: count_word 'word' /path/to/file
count_word() {
  grep -o -w "$1" "$2" | wc -l
}

# Print lines containing two different words
# Usage: grep_two_words 'word1' 'word2' /path/to/file
grep_two_words() {
  grep -e "$1" -e "$2" "$3"
}

# Extract unique IP Addresses from a file
# Usage: unique_ips /path/to/file
unique_ips() {
  grep -o -E '([0-9]{1,3}[\.]){3}[0-9]{1,3}' "$1" | sort -u
}

# Count lines of code in Python files
# Usage: loc_python /path/to/folder
loc_python() {
  find "$1" -name "*.py" | xargs wc -l
}

# Sum of a column in a CSV file
# Usage: sum_csv_col /path/to/file.csv column_number
sum_csv_col() {
  awk -F',' '{ sum += $'"$2"' } END { print sum }' "$1"
}

# Average of a column in a CSV file
# Usage: avg_csv_col /path/to/file.csv column_number
avg_csv_col() {
  awk -F',' '{ sum += $'"$2"'; n++ } END { if (n > 0) print sum / n; else print "N/A"; }' "$1"
}

# Remove duplicate lines from a file while maintaining original order
# Usage: dedupe /path/to/file
dedupe() {
  awk '!seen[$0]++' "$1"
}

# Usage: list_largest_files /path/to/folder N
list_largest_files() {
  find "$1" -type f -exec du -h {} + | sort -rh | head -n "$2"
}

# Usage: grep_in_types 'pattern' /path/to/folder 'extension'
grep_in_types() {
  find "$2" -name "*.$3" -exec grep -Hn "$1" {} +
}

# Usage: list_todos /path/to/folder
list_todos() {
  grep -rn "TODO" "$1"
}

# Usage: prettify_json /path/to/file.json
prettify_json() {
  cat "$1" | jq .
}
# Usage: dir_size /path/to/folder
dir_size() {
  du -sh "$1"
}
# Usage: my_ip
my_ip() {
  curl ifconfig.me
}
# Usage: base64_encode "string"
base64_encode() {
  echo -n "$1" | base64
}
# Usage: base64_decode "string"
base64_decode() {
  echo -n "$1" | base64 -d
}
# Usage: get_mime /path/to/file
get_mime() {
  file --mime-type -b "$1"
}
# Usage: archive_folder /path/to/folder
archive_folder() {
  tar -zcvf "$1.tar.gz" "$1"
}
# Usage: batch_rename jpg png
batch_rename() {
  for f in *."$1"; do
    mv -- "$f" "${f%.$1}.$2"
  done
}
# Usage: find_open_ports
find_open_ports() {
  netstat -tuln
}
# Usage: kill_process 'name'
kill_process() {
  pkill -f "$1"
}
# Usage: cpu_info
cpu_info() {
  lscpu
}
# Usage: extract /path/to/archive
extract() {
  if [[ -z "$1" ]]; then
    echo "Usage: extract /path/to/archive"
    return 1
  fi
  case "$1" in
    *.tar.gz) tar xzf "$1" ;;
    *.tar.xz) tar xJf "$1" ;;
    *.zip) unzip "$1" ;;
    *) echo "extract: Unknown archive format" ;;
  esac
}
# Usage: monitor_folder /path/to/folder
monitor_folder() {
  inotifywait -m -r -e modify,create,delete "$1"
}
# Usage: search_alias 'string'
search_alias() {
  alias | grep "$1"
}
# Usage: list_ssh
list_ssh() {
  ss -tn src :22
}
# Usage: quick_backup /path/to/file
quick_backup() {
  cp "$1" "$1.bak"
}













