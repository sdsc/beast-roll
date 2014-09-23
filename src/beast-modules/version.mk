NAME        = beast-modules
RELEASE     = 2
PKGROOT     = /opt/modulefiles/applications/beast

VERSION_SRC = $(REDHAT.ROOT)/src/beast_1.8.0/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
