#!/Users/dzfrias/.dotfiles/misc/qutebrowser/userscripts/venv/bin/python3

import os
import sys
import pyperclip
from googletrans import Translator

translator = Translator()
translation = translator.translate(os.environ["QUTE_SELECTED_TEXT"]).text

pyperclip.copy(translation)
