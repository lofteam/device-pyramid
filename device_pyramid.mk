#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/htc/pyramid/prebuilt/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# System properties
-include device/htc/pyramid/system_prop.mk

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    audio.primary.msm8660 \
    audio_policy.conf \
    libaudioutils \
    libdashplayer \
    libaudio-resampler

# Thermal
PRODUCT_COPY_FILES += \
    device/htc/pyramid/configs/thermald.conf:system/etc/thermald.conf

# GPS
PRODUCT_COPY_FILES += \
    device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

PRODUCT_PACKAGES += \
    libshim_log \
    libshim_camera

# Qcom
PRODUCT_PACKAGES += \
    libstlport

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    memtrack.msm8660 \
    lights.msm8660 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer

# Power
PRODUCT_PACKAGES += \
    power.msm8660

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libstagefrighthw \
    libOmxQcelp13Enc \
    libOmxEvrcEnc \
    libOmxAmrEnc

# HDMI
PRODUCT_PACKAGES += \
    hdmid

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Net
PRODUCT_PACKAGES += \
    libnetcmdiface \
    crda

# WiFi
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_default.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# Bluetooth
PRODUCT_PACKAGES += \
    bt_vendor.conf

# Healthd
PRODUCT_PACKAGES += \
    healthd

# Offmode charger
# Use cm images if available, aosp ones otherwise
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images

# Media configuration
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/htc/pyramid/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/pyramid/configs/media_profiles.xml:system/etc/media_profiles.xml


# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Charger
WITH_CM_CHARGER := false

# Camera wrapper
PRODUCT_PACKAGES += \
    camera.msm8660

DEVICE_PACKAGE_OVERLAYS += device/htc/pyramid/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.pyramid \
    init.pyramid.rc \
    init.qcom.power.rc \
    init.pyramid.usb.rc \
    ueventd.pyramid.rc \
    gps.pyramid


# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Keylayouts and Key Character Maps
PRODUCT_COPY_FILES += \
    device/htc/pyramid/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    device/htc/pyramid/keylayout/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl \
    device/htc/pyramid/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/pyramid/keylayout/keypad_8660.kl:system/usr/keylayout/keypad_8660.kl \
    device/htc/pyramid/keylayout/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm \
    device/htc/pyramid/keylayout/h2w_headset.kcm:system/usr/keychars/h2w_headset.kcm \
    device/htc/pyramid/keylayout/keypad_8660.kcm:system/usr/keychars/keypad_8660.kcm

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/pyramid/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc \
    device/htc/pyramid/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# HTC BT Audio tune
PRODUCT_COPY_FILES += device/htc/pyramid/dsp/AudioBTID.csv:system/etc/AudioBTID.csv

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/pyramid/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/pyramid/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/pyramid/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/pyramid/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/pyramid/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/pyramid/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/pyramid/dsp/TPA2051_CFG_XC.csv:system/etc/TPA2051_CFG_XC.csv \
    device/htc/pyramid/dsp/soundimage/Sound_MFG.txt:system/etc/soundimage/Sound_MFG.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP_LE.txt:system/etc/soundimage/Sound_Phone_Original_HP_LE.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP_WB_LE.txt:system/etc/soundimage/Sound_Phone_Original_HP_WB_LE.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP_WB.txt:system/etc/soundimage/Sound_Phone_Original_HP_WB.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC_NEL.txt:system/etc/soundimage/Sound_Phone_Original_REC_NEL.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_SPK_WB.txt:system/etc/soundimage/Sound_Phone_Original_SPK_WB.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Beats.txt:system/etc/soundimage/Sound_Beats.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt

# Bluetooth firmware
$(call inherit-product, device/htc/pyramid/bcm_hcd.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/pyramid/pyramid-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/pyramid/media_a1026.mk)

## htc audio settings
$(call inherit-product, device/htc/pyramid/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := pyramid
PRODUCT_NAME := pyramid
PRODUCT_BRAND := htc
PRODUCT_MODEL := Sensation
PRODUCT_MANUFACTURER := HTC
