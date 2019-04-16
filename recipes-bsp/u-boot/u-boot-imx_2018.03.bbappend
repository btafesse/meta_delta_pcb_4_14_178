# Include Kernel coniguration fragment
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
#
# Update 4/5 modified device tree and disabled tcpc,hdmi correct way
SRC_URI += "file://0001-disable-HDMI.patch \
	    file://0001-increased-temp-limit.patch \
	    file://0001-modified-device-tree.patch \
	    file://0001-removed-USBC-TCPC.patch"

