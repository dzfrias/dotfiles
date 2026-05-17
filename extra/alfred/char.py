#!/usr/bin/env python3

import sys
import json
import unicodedata


CATEGORY_DESCRIPTIONS = {
    "Lu": "Uppercase Letter",
    "Ll": "Lowercase Letter",
    "Lt": "Titlecase Letter",
    "LC": "Cased Letter",
    "Lm": "Modifier Letter",
    "Lo": "Other Letter",
    "L": "Letter",
    "Mn": "Nonspacing Mark",
    "Mc": "Spacing Mark",
    "Me": "Enclosing Mark",
    "M": "Mark",
    "Nd": "Decimal Number",
    "Nl": "Letter Number",
    "No": "Other Number",
    "N": "Number",
    "Pc": "Connector Punctuation",
    "Pd": "Dash Punctuation",
    "Ps": "Open Punctuation",
    "Pe": "Close Punctuation",
    "Pi": "Initial Punctuation",
    "Pf": "Final Punctuation",
    "Po": "Other Punctuation",
    "P": "Punctuation",
    "Sm": "Math Symbol",
    "Sc": "Currency Symbol",
    "Sk": "Modifier Symbol",
    "So": "Other Symbol",
    "S": "Symbol",
    "Zs": "Space Separator",
    "Zl": "Line Separator",
    "Zp": "Paragraph Separator",
    "Z": "Separator",
    "Cc": "Control",
    "Cf": "Format",
    "Cs": "Surrogate",
    "Co": "Private Use",
    "Cn": "Unassigned",
    "C": "Other",
}


input = sys.argv[1]

if input.lower().startswith("0x"):
    num = int(input[2:], base=16)
elif input.lower().startswith("0b"):
    num = int(input[2:], base=2)
elif len(input) == 1 and not input.isdigit():
    num = ord(input)
else:
    num = int(input)

c = chr(num)
name = unicodedata.name(c)
ccc = unicodedata.combining(c)
category = CATEGORY_DESCRIPTIONS[unicodedata.category(c)]
items = [
    {"title": name, "subtitle": "Name", "arg": name},
    {"title": c, "subtitle": "Character", "arg": c},
    {"title": ccc, "subtitle": "Combining Class", "arg": ccc},
    {"title": category, "subtitle": "Category", "arg": category},
]
decomposition = unicodedata.decomposition(c)
if decomposition:
    items.append(
        {"title": decomposition, "subtitle": "Decomposition", "arg": decomposition}
    )
items_json = json.dumps({"items": items})
print(items_json)
