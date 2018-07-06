##membuat tulisan  dan memasukkan dalam file format
echo "tulisan" > namafile.sh

##copy,cut, delete, memindahkan file folder 1 ke folder 2
cp readme.sh Desktop/labkom1 Download/labkom2
mv readme.sh Desktop/labkom1 Download/labkom2
rm readme.sh Desktop/labkom1

##crop photo 
sudo apt install shotwell 

#Cara mudah cek Processor, Memory, Harddisk, VGA, dll on Linux
#Untuk sistem operasi Linux dapat menggunakan beberapa perintah dibawah ini:
cat /proc/cpuinfo | Informasi Processor
cat /proc/meminfo | Informasi Memory
lshw | Untuk list perangkat keras
fdisk -l | Informasi Harddisk dan partisi
lspci | Informasi Controller, PCI, dll
lspci | grep VGA | Informasi VGA / Display Card
lspci | grep Eth | Informasi Ethernet Card / NIC / LAN Card
uname -a | Informasi Kernel dan jenis Processor
#eksekusi perintah dapat dilakukan di terminal/konsol, dan harus sebagai root, jika menggunakan Ubuntu dapat ditambahkan perintah sudo untuk mempermudah, mis:
sudo lshw
sudo cat /proc/cpuinfo
