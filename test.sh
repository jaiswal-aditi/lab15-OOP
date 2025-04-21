#!/bin/bash

echo "Running tests..."
echo

# Run the compiled program with input.txt and capture the output
./animal < test/input.txt > test/actual_output.txt

# Check if the program exited successfully
if [ $? -eq 0 ]; then
    echo "✅ Program exited successfully"
else
    echo "❌ Program did not exit cleanly"
    exit 1
fi

# Normalize the output to ignore whitespace differences
filtered_output=$(tr -d '[:space:]' < test/actual_output.txt)
expected_output=$(tr -d '[:space:]' < test/expected_output.txt)

# Compare outputs
if [[ "$filtered_output" == "$expected_output" ]]; then
    echo "✅ Test passed"
else
    echo "❌ Test failed"
    echo "Expected: $expected_output"
    echo "Got     : $filtered_output"
    exit 1
fi

