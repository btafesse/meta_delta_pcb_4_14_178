FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"
# Delta board 00.02.001

#modify fsl-imx8mq.dtsi to increases temp limit
SRC_URI += "file://0001-increased-temp-limit.patch"

#define fsl-imx8mq-delta
SRC_URI += "file://0001-modify-dts-makefile.patch"
SRC_URI += "file://0001-pcb-device-tree-without-wifi.patch"
#SRC_URI += "file://0001-pcb-device-tree.patch"

#modify fsl-imx8mq-evk to continue support of eval kit
SRC_URI += "file://0001-remove-wifi.patch"

#add ltr329 support
SRC_URI += "file://0001-ltr329-support.patch"

#modify defconfig (needed for ltr329, accelerometer, wifi)
SRC_URI += "file://0001-configuration-update.patch"

#add LCD driver
SRC_URI +="file://0001-lcd-driver-update.patch"
SRC_URI +="file://0001-LCD-addition-to-device-tree.patch"

#modify OV5640 driver to support both cameras
SRC_URI +="file://0001-modify-camera-driver.patch"

addtask copy_defconfig_after_patch after do_patch before do_configure
do_copy_defconfig_after_patch () {
    #copy latest imx_v7_defconfig to use
    cp ${S}/arch/arm64/configs/defconfig ${B}/.config
    cp ${S}/arch/arm64/configs/defconfig ${B}/../defconfig
}
