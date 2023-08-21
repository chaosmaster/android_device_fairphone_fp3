#!/system/bin/sh

SUFFIX=$(getprop ro.boot.slot_suffix)
BOOTDEVICE=/dev/block/bootdevice/by-name/boot${SUFFIX}
TMPFILE=$(mktemp -p /tmp)

dd if="$BOOTDEVICE" bs=2048 count=1 of="$TMPFILE"
grep -q androidboot "$TMPFILE"
if [ $? -eq 0 ]; then
    grep -q androidboot.super_partition "$TMPFILE"
    if [ $? -ne 0 ]; then
        echo "prepfstab:boot does not use dynamic partitions" >> /tmp/recovery.log
        rm /system/etc/twrp.flags
        cp /system/etc/recovery.nodynamic.fstab /system/etc/recovery.fstab
        cp /system/etc/twrp.nodynamic.fstab /system/etc/twrp.fstab
        setprop prepfstab.disable_dynamic true
        ln -s  /dev/block/bootdevice/by-name/system${SUFFIX} /dev/block/bootdevice/by-name/system
        ln -s  /dev/block/bootdevice/by-name/vendor${SUFFIX} /dev/block/bootdevice/by-name/vendor
        ln -s  /dev/block/bootdevice/by-name/product${SUFFIX} /dev/block/bootdevice/by-name/product
    else
        echo "prepfstab:boot uses dynamic partitions" >> /tmp/recovery.log
    fi
else
    echo "prepfstab:could not detect valid boot, keeping dynamic fstab" >> /tmp/recovery.log
fi

setprop fstab.ready 1

exit 0
