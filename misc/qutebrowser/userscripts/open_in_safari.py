#!/opt/homebrew/bin/python3

import os

url = os.environ["QUTE_URL"]
os.system(f"open -a Safari {url}")
