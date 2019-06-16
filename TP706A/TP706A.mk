LOCAL_PATH := device/Neffos/TP706A

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/kernel:kernel \
	$(LOCAL_PATH)/recovery/init.recovery.mt6739.rc:root/init.recovery.mt6739.rc \
	$(LOCAL_PATH)/recovery/init.recovery.usb.rc:root/init.recovery.usb.rc \
	$(LOCAL_PATH)/recovery/init.usb.configfs.rc:root/init.usb.configfs.rc \
	$(LOCAL_PATH)/recovery/init.usb.configfs.rc:root/ueventd.mt6739.rc \
	$(LOCAL_PATH)/recovery/recovery.fstab:root/recovery.fstab
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0 \
    ro.sys.usb.mtp.whql.enable=0 \
    ro.sys.usb.storage.type=mtp \
    ro.sys.usb.bicr=no \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.usb.config=mtp,adb \
    ro.treble.enabled=true
