import os
name_of_dir = '/data/data/com.termux/files/home/'

list_of_files = filter(lambda x: os.path.isfile
                (os.path.join(name_of_dir, x)),
                os.listdir(name_of_dir) )
list_of_files = sorted(list_of_files,
                key = lambda x: os.stat
                (os.path.join(name_of_dir, x)).st_size)

for name_of_file in list_of_files:
        path_of_file = os.path.join(name_of_dir, name_of_file)
        size_of_file = os.stat(path_of_file).st_size
        print(size_of_file, ' -->', name_of_file)