#!/bin/bash

declare -A disks
disks[Disk1]="/dev/nvme0n1p5"
disks[Disk2]="/dev/nvme0n1p8"
#disks[DiskName]="Path"

declare -A selection
disks_length="${#disks[@]}"

function display_menu(){
	echo "select a disk to fix:"
	index=1
	for i in ${!disks[@]}
	do
		echo "${index}. ${i} (${disks[$i]})"
		selection[$index]=$i
		let index=$(($index +1))
	done
	echo "q|Q. Exit"
}

while true; do
	display_menu
	read  -sn 1 option
	echo ""
	if [[ $option =~ ^[0-9]+$ ]] && [ $(($option -1)) -lt $disks_length ]
	then
		selected_option=${selection[$option]}
		echo $selected_option
		selected_disk=("${disks[$selected_option]}")
	else
		if [ $option = q ] || [ $option = Q ]
		then
			echo "Bye bye"		
			exit 0
		else
			echo "Wrong input, exiting"		
			exit 0
		fi
	fi

	echo "Working on ${selected_option} (${selected_disk})"
	read
	echo "unmountig..."
	sudo umount $selected_disk 
	echo "fixing..."
	sudo ntfsfix $selected_disk
	echo "mountig..."
	sudo mount $selected_disk
	echo ""
	echo "----------------------------------"
	echo ""
done
