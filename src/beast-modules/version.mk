PACKAGE     = beast
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 6
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)_1.8.2/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)
EXTRA_MODULE_VERSIONS = 1.8.1

RPM.EXTRAS  = AutoReq:No
