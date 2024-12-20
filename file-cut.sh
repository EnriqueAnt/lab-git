#!/bin/bash

divisor=10

for file in *.fastq; do
  total_lines=$(wc -l < "$file")
  lines_to_cut=$((total_lines / divisor))
  output_file="${file%.fastq}_output.fastq"
  head -n "$lines_to_cut" "$file" > "$output_file"
done

echo "Procesamiento completado: archivos .fastq recortados al 10%."

