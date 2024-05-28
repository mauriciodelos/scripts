# NTFS Disk/Partition fixer for Linux (Bash script)

### Usually, when we use Windows and Linux in the same machine, Windows locks the disks/partition so when we open them in Linux, they are mounted as Read only.
### Well, this script will fix any NTFS disk/partition using the ntfsfix utility.
#### Of course it's not something exceptional, just a UI help for a recurrent manual process.

## USE
1. Open the script for edit
1. Modify the current disks/partitions names and paths and add new ones if needed
    ```bash
      disks[Disk1]="/dev/nvme0n1p5"
      disks[Disk2]="/dev/nvme0n1p8"
      #disks[DiskName]="Path"
    ``` 
1. Save the file.
1. Run it with bash or sh (it can fail with sh due some unsuported functions)
1. Choose the disk/partitions you want to fix or exit the script.
    ```cmd
      Select a disk to fix:
      1. Disk2 (/dev/sda1)
      2. Disk1 (/dev/nvme0n1p5)
      q|Q. Exit
    ```
1. Now the script will run some superuser commands, so the system will ask for your credentials to:
   - Unmount the disk/partition
   - Use ntfsfix
   - Mount the disk/partition again
1. Now you can fix another disk/partition or exit the script

