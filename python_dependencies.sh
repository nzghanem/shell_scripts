#!/bin/bash


while true 
	do 
		python $1 2> error.log
		if [[ $? -gt 0 ]]; then 
			MODULE_NAME=$(grep -F "No module named" error.log | \
			awk '{print $NF}' | \
			sed s/\'//g)
			pip install $MODULE_NAME
		else
			echo "Installation Completed!"
			break
		fi
	done