#!/opt/homebrew/bin/python3

import os
import sys
from urllib.parse import urlparse

url = urlparse(os.environ["QUTE_URL"])
if not url.hostname.endswith(".google.com"):
    print("Invalid URL!", file=sys.stderr)
    sys.exit(1)

parts = url.path.split("/")
idx = parts.index("u")
if idx != -1:
    parts[idx + 1] = "1" if parts[idx + 1] == "0" else "0"
url = url._replace(path="/".join(parts[1:]))

with open(os.environ["QUTE_FIFO"], "w") as fifo:
    fifo.write(f"open {url.geturl()}")
