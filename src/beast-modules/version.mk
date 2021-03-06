ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

PACKAGE     = beast
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 0
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)_1.10.4/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)
EXTRA_MODULE_VERSIONS = 1.8.0 1.8.1 1.8.2

RPM.EXTRAS  = AutoReq:No\nAutoProv:No
RPM.PREFIX  = $(PKGROOT)
