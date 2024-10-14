import json

# Specify the input text file and output JSON file
input_file = 'ptarget.txt'  # Replace with your input text file name
output_file = 'targets.json'

# Define the static labels
labels = {
    "job": "node-aws",
    "cloud": "aws",
    "owner": "Vishal",
    "location": "us-east-1"
}

# Initialize the targets list
targets = []

# Read the IP addresses from the text file
with open(input_file, 'r') as file:
    # Iterate over each line in the file
    for line in file:
        ip_address = line.strip()  # Remove any leading/trailing whitespace
        if ip_address:  # Check if the line is not empty
            # Append the IP address to the targets list with port 9100
            targets.append(f"{ip_address}:9100")

# Create the final output structure
output_data = [
    {
        "labels": labels,
        "targets": targets
    }
]

# Write the output data to the JSON file
with open(output_file, 'w') as json_file:
    json.dump(output_data, json_file, indent=4)

print(f"Successfully written IP addresses to {output_file}")