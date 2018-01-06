
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lemfo/LEM5PRO/LEM5PRO-vendor.mk)

LOCAL_PATH := device/lemfo/LEM5PRO

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Boot animation
# Select the 720-width one; despite the variables' names, they seem to be
# used by bootanimation only.
TARGET_SCREEN_HEIGHT := 400
TARGET_SCREEN_WIDTH := 400

PRODUCT_PACKAGES += \
	libxlog

# various MTK ABI fixes
# this is the approach of the cm-13.0 sprout port
PRODUCT_PACKAGES += \
	libmtkabi

# Display
PRODUCT_PACKAGES += \
	libgralloc_extra \
	libion_mtk \
	libion \
	libui_ext \
	libgui_ext \
	guiext-server \
	libmtk_drvb

# Offline charge
#PRODUCT_PACKAGES += \
	charger \
	charger_res_images
#	kpoc_charger \
#	libshowlogo

# Power
#PRODUCT_PACKAGES += \
#	power.mt6580

# Lights
PRODUCT_PACKAGES += \
	lights.mt6580

# Camera
#PRODUCT_PACKAGES += \
#	libnvramagentclient \
#	libcamera_client_mtk

# Audio
PRODUCT_PACKAGES += \
	audio.r_submix.default \
	audio_policy.default \
	libtinycompress \
	libtinyxml \
	libblisrc \
	libblisrc32

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Wifi
PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Bluetooth
PRODUCT_PACKAGES += \
	libbt-vendor \
	audio.a2dp.default

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/bluetooth/auto_pair_blacklist.conf:system/etc/bluetooth/auto_pair_blacklist.conf \
	$(LOCAL_PATH)/configs/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	$(LOCAL_PATH)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml \
	$(LOCAL_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	$(LOCAL_PATH)/configs/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf

# RIL
PRODUCT_PACKAGES += \
	gsm0710muxd \
	gsm0710muxdmd2 \
	mtkrild \
	mtkrildmd2 \
	mtk-ril \
	mtk-rilmd2 \
	ccci_fsd \
	ccci_mdinit \
	libccci_util \
	terservice \
	libterservice \
	muxreport

# Telecom
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
	$(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml \
	$(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# GPS
PRODUCT_COPY_FILES += \
	 $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

PRODUCT_PACKAGES += \
	gps.mt6580

# Sensor Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:system/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# MiraVision
#PRODUCT_PACKAGES += \
#	MiraVision

# EngineerMode
#PRODUCT_PACKAGES += \
#	EngineerMode

# Add packages
PRODUCT_PACKAGES += \
	ClockSkinCoco \
	CalculatorTT \
	CalendarTT \
	StopwatchTT

# Remove packages
PRODUCT_PACKAGES += \
	RemovePackages

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Thermal
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
	$(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
	$(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/fstab.mt6580:root/fstab.mt6580 \
	$(LOCAL_PATH)/root/twrp.fstab:recovery/root/etc/twrp.fstab \
	$(LOCAL_PATH)/root/init.mt6580.rc:root/init.mt6580.rc \
	$(LOCAL_PATH)/root/init.mt6580.usb.rc:root/init.mt6580.usb.rc \
	$(LOCAL_PATH)/root/init.recovery.mt6580.rc:root/init.recovery.mt6580.rc \
	$(LOCAL_PATH)/root/init.mt6580.modem.rc:root/init.mt6580.modem.rc \
	$(LOCAL_PATH)/root/init.nvdata.rc:root/init.nvdata.rc \
	$(LOCAL_PATH)/root/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/root/init.xlog.rc:root/init.xlog.rc \
	$(LOCAL_PATH)/root/ueventd.mt6580.rc:root/ueventd.mt6580.rc \
	$(LOCAL_PATH)/root/init.mt6580.power.rc:root/init.mt6580.power.rc \
	$(LOCAL_PATH)/root/sbin/busybox:root/sbin/busybox \
	$(LOCAL_KERNEL):kernel

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	ro.zygote=zygote32 \
	ro.mount.fs=EXT4 \
	persist.sys.usb.config=mtp \
	ro.hardware=mt6580

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.service.acm.enable=0 \
	ro.oem_unlock_supported=1

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Europe/Budapest \
	ro.product.locale=hu-HU \
	ro.product.locale.region=HU \
	ro.product.locale.language=hu

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# Screen density
PRODUCT_AAPT_CONFIG := small
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi
PRODUCT_CHARACTERISTICS := nosdcard,watch

PRODUCT_COPY_FILES += device/lemfo/LEM5PRO/bootanim/bootanimation.zip:system/media/bootanimation.zip

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-2048-dalvik-heap.mk)
