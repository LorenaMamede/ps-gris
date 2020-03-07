import os
from pathlib import Path
key = open("/tmp/key", "r").read(1);
user = os.getenv('USER')
path = '/home/' + user + '/Downloads/' + user
all_files = os.listdir(path)
for file in all_files:
    with open(path + "/"  + file, "r") as f:
        original_file = open(path + "/" + file.replace('.leo',''), "a")
        while True:
            c = f.read(1)
            if not c:
                break
            dc = ord(c) - int(key)
            original_file.write(chr(dc))
    f.close()
    original_file.close()

os.system('find ' + path + ' -type f -name \'*.leo\' -delete')
print(os.listdir(path))
