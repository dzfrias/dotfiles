#!/usr/bin/env python3

import sys
import json
import unicodedata


input = sys.argv[1]

if input.lower().startswith("0x"):
    num = int(input[2:], base=16)
    original = "hex"
elif input.lower().startswith("0b"):
    num = int(input[2:], base=2)
    original = "binary"
elif len(input) == 1 and not input.isdigit():
    num = ord(input)
    original = "char"
else:
    num = int(input)
    original = "decimal"

raw_items = []
subtitles = []
if original != "hex":
    raw_items.append(f"0x{num:X}")
    subtitles.append("Hexadecimal")
if original != "binary":
    raw_items.append(f"0b{num:b}")
    subtitles.append("Binary")
if original != "decimal":
    raw_items.append(str(num))
    subtitles.append("Decimal")
if original != "char":
    try:
        c = chr(num)
        raw_items.append(chr(num))
        name = unicodedata.name(c)
        subtitles.append(f"Character ({name})")
    except ValueError:
        pass


items = [
    {"title": s, "subtitle": sub, "arg": s} for s, sub in zip(raw_items, subtitles)
]
items_json = json.dumps({"items": items})
print(items_json)
