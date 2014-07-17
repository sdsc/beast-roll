VERSION = 1.8.0
NAME    = beast-$(VERSION)_$(ROLLCOMPILER)
RELEASE = 0
PKGROOT = /opt/beast/$(VERSION)

SRC_SUBDIR         = beast-$(VERSION)

SOURCE_NAME        = beast
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No
