# 对所有非系统盘进行格式化

bootdisk=$(df -h | awk '{print $1}' | grep -E "/dev/(sd|nvme)" | sed 's/p[0-9]*//g' | sort -u)
osdisk="${bootdisk#/dev/}"
echo $osdisk

partition_and_format() {
    local nvmey="$1"
    parted "/dev/${nvmey}" mklabel gpt
    echo I | parted "/dev/${nvmey}" mkpart primary 0 100% --align=optimal

    mkfs.ext4 "/dev/${nvmey}1"
}


for nvmey in $(lsblk | grep -i disk | grep -vw "$osdisk" | awk '{print $1}'); do
    echo "$nvmey start format"
    partition_and_format "$nvmey"
done

