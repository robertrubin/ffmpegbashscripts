# ffmpeg -h encoder=libx265



file="$1"
codec="$2"
crf="$3"
preset=$4
timein="$5"
timeout="$6"

if [[ $1 -eq "-h" ]]; then 
    echo "Command [File] [Codec - 264 or 265] [CRF] [Preset] [Time-In 00:00:00] [Time-Out 00:00:00]";
else
    if [[ $5 -eq $null && $6 -eq $null ]]; then
        5="Beginning"
        6="End"
        ffmpeg -y -i $1 -c:v libx$2 -preset $4 -crf $3 -tune grain -c:a aac -b:a 128k -ar 44100 -ac 2 CRF-$3_Preset-$4_start-$5_end-$6_libx$2.mp4
    else
        ffmpeg -y -ss $5 -i $1 -to $6 -c:v libx$2 -preset $4 -crf $3 -tune grain -c:a aac -b:a 128k -ar 44100 -ac 2 CRF-$3_Preset-$4_start-$5_end-$6_libx$2.mp4
    fi
fi