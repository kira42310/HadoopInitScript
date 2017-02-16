#### This is hadoop install script ####

#### Prepare system ####
yum update -y
yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel ntp wget -y
#### Adding user hdfs ####
useradd hdfs
#groupadd hdfs
usermod -a -G hdfs hdfs
cp hadoop-2.6.5.tar.gz /home/hdfs
#### Append environment to bashrc ####
su - hdfs -c "tar -xvzf hadoop-2.6.5.tar.gz"
su - hdfs -c "mv hadoop-2.6.5 hadoop"
su - hdfs -c "echo '' >> ~/.bashrc"
su - hdfs -c "echo '' >> ~/.bashrc"
su - hdfs -c "echo 'export HADOOP_HOME=/home/hdfs/hadoop' >> ~/.bashrc"
su - hdfs -c "echo 'export HADOOP_INSTALL=\$HADOOP_HOME' >> ~/.bashrc"
su - hdfs -c "echo 'export HADOOP_MAPRED_HOME=\$HADOOP_HOME' >> ~/.bashrc"
su - hdfs -c "echo 'export HADOOP_COMMON_HOME=\$HADOOP_HOME' >> ~/.bashrc"
su - hdfs -c "echo 'export HADOOP_HDFS_HOME=\$HADOOP_HOME' >> ~/.bashrc"
su - hdfs -c "echo 'export YARN_HOME=\$HADOOP_HOME' >> ~/.bashrc"
su - hdfs -c "echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native' >> ~/.bashrc"
su - hdfs -c "echo 'export PATH=\$PATH:\$HADOOP_HOME/sbin:\$HADOOP_HOME/bin' >> ~/.bashrc"
su - hdfs -c "echo '' >> ~/.bashrc"
su - hdfs -c "echo 'export JAVA_HOME=/usr/lib/jvm/java-1.7.0' >> ~/.bashrc"
su - hdfs -c "echo 'export JRE_HOME=/usr/lib/jvm/java-1.7.0/jre' >> ~/.bashrc"
su - hdfs -c "echo 'export PATH=\$PATH:/usr/lib/jvm/java-1.7.0/bin:/usr/lib/jvm/java-1.7.0/jre/bin' >> ~/.bashrc"
su - hdfs -c "source ~/.bashrc"
#### Backup file ####
su - hdfs -c "mv ~/hadoop/etc/hadoop/core-site.xml ~/hadoop/etc/hadoop/core-site.xml.bak"
su - hdfs -c "mv ~/hadoop/etc/hadoop/hdfs-site.xml ~/hadoop/etc/hadoop/hdfs-site.xml.bak"
su - hdfs -c "mv ~/hadoop/etc/hadoop/yarn-site.xml ~/hadoop/etc/hadoop/yarn-site.xml.bak"
#### core-site.xml ####
su - hdfs -c "echo -e '<configuration>\n	<property>\n		<name>fs.default.name</name>\n		<value>hdfs://hmaster:9000</value>\n	</property>\n</configuration>' > ~/hadoop/etc/hadoop/core-site.xml"
#### hdfs-site.xml ####
su - hdfs -c "echo -e '<configuration>\n	<property>\n		<name>dfs.replication</name>\n		<value>xxx</value>\n	</property>\n	<property>\n		<name>dfs.name.dir</name>\n		<value>file:///home/hdfs/hadoopdata/hdfs/namenode</value>\n	</property>\n	<property>\n		<name>dfs.data.dir</name>\n		<value>file:///home/hdfs/hadoopdata/hdfs/datanode</value>\n	</property>\n</configuration>' > ~/hadoop/etc/hadoop/hdfs-site.xml"
#### mapred-site.xml ####
su - hdfs -c "echo -e '<configuration>\n	<property>\n		<name>mapreduce.framework.name</name>\n		<value>yarn</value>\n	</property>\n</configuration>' > ~/hadoop/etc/hadoop/mapred-site.xml"
#### yarn-site.xml ####
su - hdfs -c "echo -e '<configuration>\n	<property>\n		<name>yarn.nodemanager.aux-services</name>\n		<value>mapreduce_shuffle</value>\n	</property>\n	<property>\n		<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>\n		<value>org.apache.hadoop.mapred.ShuffleHandler</value>\n	</property>\n	<property>' > ~/hadoop/etc/hadoop/yarn-site.xml"
#su - hdfs -c "echo -e '<configuration>\n	<property>\n		<name>yarn.nodemanager.aux-services</name>\n		<value>mapreduce_shuffle</value>\n	</property>\n	<property>\n		<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>\n		<value>org.apache.hadoop.mapred.ShuffleHandler</value>\n	</property>\n	<property>\n		<name>yarn.resourcemanager.resource-tracker.address</name>\n		<value>hmaster:8025</value>\n	</property>\n	<property>\n		<name>yarn.resourcemanager.scheduler.address</name>\n		<value>hmaster:8030</value>\n	</property>\n	<property>\n		<name>yarn.resourcemanager.address</name>\n		<value>hmaster:8040</value>\n	</property>\n</configuration>' > ~/hadoop/etc/hadoop/yarn-site.xml"
#### Stop and disable firewall ####
systemctl stop firewalld
systemctl disable firewalld
