# Create a hierarchy of random files and subdirectories

### Run as : ###
```
./create_infiles.sh dir_name num_of_files num_of_dirs levels
```
where : <br>
* **dir_name** : the name of the directory to create everything inside. **CAUTION** if directory already exists it will erase it and create a new empty one!
* **num_of_files** : the total number of files to be created
* **num_of_dirs** : the total number of directories to be created
* **levels** : the number of levels to distribute the directories (the heighest depth of a subdirectory)

### 1. Create directories with names with random numbers and characters of length 1-8 and distribute them to the given levels (depth of subdirectories). ##
For example if num_of_dirs=5 and levels=3 the directories will be created as: <br>
thedir/zs2lW3nn <br>
thedir/zs2lW3nn/pKbkBm <br>
thedir/zs2lW3nn/pKbkBm/3 <br>
thedir/pUMy8K <br>
thedir/pUMy8K/Ww4 <br>
### 2. Create files with names with random numbers and characters of length 1-8 and write in them a random string (numbers and characters) with size 1-128 kb. Distribute them in a round-robin order to the subdirectories. ##
For example if num_of_files=8 : <br>
thedir/5Brt7w <br>
thedir/zs2lW3nn/TtrgE6 <br>
thedir/zs2lW3nn/pKbkBm/791PBb <br>
thedir/zs2lW3nn/pKbkBm/3/Qg  <br>
thedir/pUMy8K/xIUcAZ9C  <br>
thedir/pUMy8K/Ww4/wvPOWxLF  <br>
thedir/R  <br>
thedir/zs2lW3nn/Ch224y <br>

