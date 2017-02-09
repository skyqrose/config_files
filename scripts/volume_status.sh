volume=$(amixer get Master | grep 'Front Left:' | cut -d ' ' -f 7 | sed -e 's/[^0-9]//g')
state=$(amixer get Master | grep 'Front Left:' | grep -o "\[\(off\|on\)\]")
speaker_symbol="🔊"
case $state in
    "[on]")
        echo "$speaker_symbol ${volume}"
        ;;
    "[off]")
        echo "$speaker_symbol (${volume})"
        ;;
    *)
        echo "$speaker_symbol ?${volume}?"
esac
