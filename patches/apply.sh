#!/bin/bash
cd ../../../../frameworks/av
git apply -v ../../device/ark/benefit_m7/patches/framework_av/0001-libmedia-stub-out-MTK-specific-bits-audio-working.patch
#git apply -v ../../device/ark/benefit_m7/patches/framework_av/0002-#camera.patch
cd ../..
cd frameworks/base
git apply -v ../../device/ark/benefit_m7/patches/framework_base/0001-SlimLP-base-patch.patch
git apply -v ../../device/ark/benefit_m7/patches/framework_base/0002-SlimLP-mtk-patch.patch
cd ../opt/telephony
git apply -v ../../../device/ark/benefit_m7/patches/framework_opt_telephony/0001-SlimLP-patch-MTK.patch
git apply -v ../../../device/ark/benefit_m7/patches/framework_opt_telephony/0002-SlimLP-patch-mtk.patch
git apply -v ../../../device/ark/benefit_m7/patches/framework_opt_telephony/0002_mobile_data_patch_mt6753.patch
cd ../../..
cd packages/services/Telephony
git apply -v ../../../device/ark/benefit_m7/patches/packages_services_Telephony/0001-Update-for-mtk.patch
cd ../../..
cd system/core
git apply -v ../../device/ark/benefit_m7/patches/system_core/0001-fix-boot-for-mtk.patch
cd ../..
cd system/netd
git apply -v ../../device/ark/benefit_m7/patches/system_netd/0001-hotpost-fix.patch
cd ../..
cd hardware/libhardware
git apply -v ../../device/ark/benefit_m7/patches/hardware_libhardware/0001-fix-gps-light-audio.patch
cd ../..
cd hardware/libhardware_legacy
git apply -v ../../device/ark/benefit_m7/patches/hardware_libhardware_legacy/0001-patch-for-mtk.patch
cd ../../
echo DONE !

