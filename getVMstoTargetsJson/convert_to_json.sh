#!/bin/bash

# Specify the input text file and output JSON file
input_file="ptarget.txt"  # Replace with your input text file name
output_file="targets.json"

# Define the static labels
labels='{
    "job": "node-aws",
    "cloud": "aws",
    "owner": "Vishal",
    "location": "us-east-1"
}'

# Initialize the JSON output
echo "[" > "$output_file"
echo "    {" >> "$output_file"
echo "      \"labels\": $labels," >> "$output_file"
echo "      \"targets\": [" >> "$output_file"

# Read IP addresses from the input file
first_line=true
while IFS= read -r line; do
    ip_address=$(echo "$line" | xargs)  # Trim whitespace
    if [[ -n "$ip_address" ]]; then  # Check if the line is not empty
        # Append the IP address to the targets list with port 9100
        if $first_line; then
            echo "        \"$ip_address:9100\"" >> "$output_file"
            first_line=false
        else
            echo "        ,\"$ip_address:9100\"" >> "$output_file"
        fi
    fi
done < "$input_file"

# Finalize the JSON output
echo "      ]" >> "$output_file"
echo "    }" >> "$output_file"
echo "]" >> "$output_file"

echo "Successfully written IP addresses to $output_file"
