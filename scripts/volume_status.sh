volume=$(amixer get Master | grep 'Front Left:' | cut -d ' ' -f 7 | sed -e 's/[^0-9]//g')
state=$(amixer get Master | grep 'Front Left:' | grep -o "\[\(off\|on\)\]")
speaker3="🔊"
speaker1="🔉"
speaker0="🔈"
speaker_mute="🔇"
case $state in
    "[on]")
        if [ $volume -lt 1 ]
        then
          speaker_symbol="$speaker_mute"
        elif [ $volume -lt 30 ]
        then
          speaker_symbol="$speaker0"
        elif [ $volume -lt 60 ]
        then
          speaker_symbol="$speaker1"
        else
          speaker_symbol="$speaker3"
        fi
        echo "$speaker_symbol ${volume}"
        ;;
    "[off]")
        echo "$speaker_mute (${volume})"
        ;;
    *)
        echo "$speaker3 ?${volume}?"
esac
