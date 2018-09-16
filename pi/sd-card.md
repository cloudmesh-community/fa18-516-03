diskutil list

```
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *1.1 TB     disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:          Apple_CoreStorage ailin                   100.4 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
   4:                  Apple_HFS sandbox                 100.0 GB   disk0s4
   5:                  Apple_HFS user                    848.7 GB   disk0s5

/dev/disk1 (internal, virtual):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:                  Apple_HFS ailin                  +100.0 GB   disk1
                                 Logical Volume on disk0s2
                                 86BD3B9A-6550-4637-A37D-710AD920C7F4
                                 Unencrypted

/dev/disk2 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *31.9 GB    disk2
   1:             Windows_FAT_16 RECOVERY                1.6 GB     disk2s1
   2:                      Linux                         33.6 MB    disk2s5
   3:             Windows_FAT_32 boot                    69.2 MB    disk2s6
   4:                      Linux                         30.2 GB    disk2s7

```

grep for: 
```
/dev/disk2 (external, physical):
```

diskutil unmountDisk /dev/disk2

dd bs=1m if=../../images/2018-06-27-raspbian-stretch-lite.img of=/dev/rdisk2 conv=sync

Pipe through pv to watch progress

Convert
```
sudo dd if=image/image.img of=/dev/rdisk2 bs=1m conv=sync
```
to
```
sudo dd if=/dev/sdb | pv -s 2G | dd of=/dev/rdisk2 bs=1m conv=sync
```
or
```
pv /home/user/bigfile.iso | dd of=/dev/rdisk2 bs=1m conv=sync
```

```
diskutil eject /dev/rdisk2
```

Completed working setup on Raspberry PI.
