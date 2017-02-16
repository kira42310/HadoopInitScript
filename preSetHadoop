
#### Hadoop OS Tuning ####

ulimit -S 4096
ulimit -H 32832
sysctl -w fs.file-max=6544018
echo '' >> /etc/sysctl.conf
echo '#### set the system wide file ####' >> /etc/sysctl.conf
echo 'fs.file-max=6544018' >> /etc/sysctl.conf
sysctl -w net.core.somaxconn=1024
echo '' >> /etc/sysctl.conf
echo '#### Set network parameters ####' >> /etc/sysctl.conf
echo 'net.core.somaxconn=1024' >> /etc/sysctl.conf
echo 'never' > /sys/kernel/mm/redhat_transparent_hugepages/defrag
if test -f /sys/kernel/mm/redhat_transparent_hugepage/defrag; then echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag ;fi
sysctl -w vm.swappiness=0
echo '' >> /etc/sysctl.conf
echo '#### Reduce the swap memory ####' >> /etc/sysctl.conf
echo 'vm.swappiness=0' >> /etc/sysctl.conf
