#!/sbin/sh

load_panel_modules()
{
    path=$1
    panel_supplier=""
    panel_supplier=$(cat /sys/devices/virtual/graphics/fb0/panel_supplier 2> /dev/null)

    case $panel_supplier in
        boe | tianmah)
            insmod $path/himax_mmi.ko
            ;;
        tianman)
            insmod $path/nova_mmi.ko
            ;;
        tianma)
            insmod $path/synaptics_tcm_i2c.ko
            insmod $path/synaptics_tcm_core.ko
            insmod $path/synaptics_tcm_touch.ko
            insmod $path/synaptics_tcm_device.ko
            insmod $path/synaptics_tcm_reflash.ko
            insmod $path/synaptics_tcm_testing.ko
            ;;
        *)
            echo "$panel_supplier not supported"
            ;;
    esac
}

# Main
SLOT=`getprop ro.boot.slot_suffix`
mount /dev/block/bootdevice/by-name/vendor$SLOT /vendor -o ro

# MMI Common
insmod /vendor/lib/modules/exfat.ko
insmod /vendor/lib/modules/utags.ko
insmod /vendor/lib/modules/sensors_class.ko
insmod /vendor/lib/modules/mmi_annotate.ko
insmod /vendor/lib/modules/mmi_info.ko
insmod /vendor/lib/modules/tzlog_dump.ko
insmod /vendor/lib/modules/mmi_sys_temp.ko

# River specific
insmod /vendor/lib/modules/tps61280.ko
insmod /vendor/lib/modules/drv2624_mmi.ko
insmod /vendor/lib/modules/aw869x.ko
insmod /vendor/lib/modules/sx933x_sar.ko

# Load panel modules
if [ -d /vendor/lib/modules ]; then
    load_panel_modules /vendor/lib/modules
else
    # In case /vendor is empty for whatever reason
    # make sure at least touchscreen is working
    load_panel_modules /sbin/modules
fi

umount /vendor
setprop drivers.loaded 1
