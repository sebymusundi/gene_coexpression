#! /bin/bash

# File containing IDS

sample_id=$(cat sample_file.txt)
URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR114/"
values=("082" "083" "084"  "085" "086" "087" "088" "089" "090" "091" "092" "093" "094"
"095" "096" "097" "098" "099" "000" "001" "002" "003" "004" "005")


# Read sample IDs from the file into an array
sample_id=($(cat sample_file.txt))

# Define the base URL
URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR114/"

# Initialize an index variable
index=0

# Loop through the range of values from 82 to 83
for value in ${values[@]}; do
    # Get the corresponding sample ID using the index
    seq="${sample_id[index]}"
    
    # Generate the FTP URL
    FTP_URL="${URL}${value}/${seq}/${seq}_1.fastq.gz"
    FTP_URL_1="${URL}${value}/${seq}/${seq}_2.fastq.gz"
    
    wget "$FTP_URL"
    wget "$FTP_URL_1"
    
    # Increment the index and wrap around if needed
    ((index++))
    if [ $index -ge ${#sample_id[@]} ]; then
        index=0
    fi
done
