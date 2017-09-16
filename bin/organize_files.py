import os
import shutil
import sys

EXTENSION_DIRS = {".txt":"text_files", ".pdf":"pdf_docs", ".jpg":"jpg_images"}

# Discard extra args. We assume the shell has done expanduser for us.
if len(sys.argv) > 1 and os.path.isdir(sys.argv[1]):
    workdir = sys.argv[1]
else:
    workdir = '.'

for root, dirs, files in os.walk(workdir):
    for file in files:
        ext = os.path.splitext(file)[1]
        if ext in EXTENSION_DIRS:
            destdir = os.path.join(workdir, EXTENSION_DIRS.get(ext))
            os.makedirs(destdir, exist_ok=True)
            shutil.move(os.path.join(root, file), destdir)