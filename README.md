# CS 2043 – Assignment #5

## Project Description

This repository contains the `wordCount.sh` script, a utility designed to analyze plain text files for word frequency. The script counts occurrences of all words in a file, identifying potential padding with repetitive sentences and extraneous words.

### Key Features:

- **Word Counting**: Counts the occurrence of each word in the provided text file, ignoring capitalization.
- **Warning System**: Flags words that appear 5 or more times with a "WARNING!" message.
- **Detailed Report**: Outputs a report detailing the frequency of each word, formatted to highlight significant repetitions.

## Usage

To use the `wordCount.sh` script, follow these steps:

1. Ensure the script is executable. If not, make it executable:
    ```bash
    chmod +x wordCount.sh
    ```
2. Run the script with a text file as an argument:
    ```bash
    ./wordCount.sh <filename>
    ```

### Example Command

```bash
./wordCount.sh simplefile
