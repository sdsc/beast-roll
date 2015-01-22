PACKAGE     = beast
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 5
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)_1.8.1/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)
EXTRA_MODULE_VERSIONS = 1.8.0

RPM.EXTRAS  = AutoReq:No
