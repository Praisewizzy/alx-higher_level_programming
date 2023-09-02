#!/bin/bash

# Check if a URL argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

# Get the URL from the command line argument
url="$1"

# Send a GET request to the URL using curl and store the response in a temporary file
response_file=$(mktemp)
curl -s -o "$response_file" "$url"

# Check if curl encountered an error
if [ $? -ne 0 ]; then
  echo "Error: Failed to retrieve the URL."
  exit 1
fi

# Get the size of the response body in bytes
response_size=$(wc -c < "$response_file")

# Display the size of the response body
echo "Size of the response body: $response_size bytes"

# Clean up the temporary file
rm "$response_file"

