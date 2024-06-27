# Compress
# dd if=/dev/INPUT/DEVICE-NAME-HERE conv=sync,noerror bs=64K | gzip -c > /path/to/my-disk.image.gz

# Extract
# gunzip -c IMAGE.HERE-GZ | dd of=/dev/OUTPUT/DEVICE-HERE