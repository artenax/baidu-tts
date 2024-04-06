import os

def rename_files(folder_path):
    files = os.listdir(folder_path)
    files.sort(key=lambda x: int(''.join(filter(str.isdigit, x))))
    for i, file_name in enumerate(files, start=1):
        new_name = '{:04d}'.format(i) + '.mp3'
        os.rename(os.path.join(folder_path, file_name), os.path.join(folder_path, new_name))

folder_path = '/tmp/audio/mp3'
rename_files(folder_path)
