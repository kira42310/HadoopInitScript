
#### Hadoop OS Tuning ####

#### Open file hendler and files ####
ulimit -S 4096
ulimit -H 32832
sysctl -w fs.file-max=6544018
echo '' >> /etc/sysctl.conf
echo '#### set the system wide file ####' >> /etc/sysctl.conf
echo 'fs.file-max=6544018' >> /etc/sysctl.conf
#### Filesystem Type and reserved space ####
#
# UUID=gfd3f77-6b11-4ba0-8df9-75feb03476efs /disk1                 ext4   noatime       0 0
#
#### Network parameter tuning ####
sysctl -w net.core.somaxconn=1024
echo '' >> /etc/sysctl.conf
echo '#### Set network parameters ####' >> /etc/sysctl.conf
echo 'net.core.somaxconn=1024' >> /etc/sysctl.conf
#### Transparent huge page compaction ####
echo 'never' > /sys/kernel/mm/redhat_transparent_hugepages/defrag
if test -f /sys/kernel/mm/redhat_transparent_hugepage/defrag; then echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag ;fi
#### Disable swap ####
sysctl -w vm.swappiness=0
echo '' >> /etc/sysctl.conf
echo '#### Reduce the swap memory ####' >> /etc/sysctl.conf
echo 'vm.swappiness=0' >> /etc/sysctl.conf
