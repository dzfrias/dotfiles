#!/opt/homebrew/bin/python3

import os
import sys
from urllib.parse import urlparse

url = urlparse(os.environ["QUTE_URL"])
if not url.hostname.endswith(".google.com"):
    print("Invalid URL!", file=sys.stderr)
    sys.exit(1)

parts = url.path.split("/")
if parts[2] == "u":
    parts[3] = "1" if parts[3] == "0" else "0"
    print(parts)
else:
    parts.insert(2, "u")
    parts.insert(3, "1")
url = url._replace(path="/".join(parts[1:]))

with open(os.environ["QUTE_FIFO"], "w") as fifo:
    fifo.write(f"open {url.geturl()}")
