#!/bin/zsh

if [ "$1" = "CLIPBOARD" ]; then
  contents=$(pbpaste)
else
  contents=$1
fi

clen=$(echo -n "$contents" | wc -c | cut -wf2)
wlen=$(echo -n "$contents" | wc -w | cut -wf2)
llen=$(echo -n "$contents" | wc -l | cut -wf2)
cat << EOB
{"items": [
    {
        "title": "Characters",
		"subtitle": "$clen",
        "arg": "$clen"
    },
    {
        "title": "Words",
		"subtitle": "$wlen",
        "arg": "$wlen"
    },
    {
        "title": "Lines",
		"subtitle": "$llen",
        "arg": "$llen"
    }
]}
