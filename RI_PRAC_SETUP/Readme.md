# Log into JupyterHub
Run the following to forward port 9000 to your laptop
ssh -L 9000:localhost:9000 [username]@skabigdata.idia.ac.za 

Now you can navigate your browser to localhost:9000 and work within a notebook.

Datasets:
The data for this project is located in /data/projects/rfi_mitigation/. Please copy the datasets before trying to read from 
them. These datasets cannot be opened by multiple users in parallel.

Notes:
 - The group is limited to 10 logical CPU cores and 32GiB. If your kernel disconnects you may have run out of memory, in which case
 the OOM killer have reaped your process. You will need to restart the kernel in such an event and carve up the data into finer
 blocks
