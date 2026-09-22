#!/bin/bash
set -euo pipefail

ARCHIVE_URL="https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz"
SOURCE_ARCHIVE="lab3-bundle.tar.gz"

curl -L --fail --silent --show-error "$ARCHIVE_URL" -o "$SOURCE_ARCHIVE"
tar -xzf "$SOURCE_ARCHIVE"

awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv
tr '\t' ',' < cleaned.tsv > cleaned.csv

DATA_ROWS=$(awk 'NR > 1 { count++ } END { print count + 0 }' cleaned.csv)
echo "Data rows remaining: $DATA_ROWS"

tar -czf converted-archive.tar.gz cleaned.csv

