
#!/bin/sh
! Suppose you want to delete the job with id
id_init=12276822
id_final=12276984
while [ $id_init -le $id_final ]; do
    echo $id_init
    scancel $id_init
    id_init=$((id_init + 1))
done
