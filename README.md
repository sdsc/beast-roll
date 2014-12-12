# SDSC "beast" roll

## Overview

This roll bundles the Bayesian Evolutionary Analysis Sampling Trees package.

For more information about BEAST please visit the <a
href="http://beast.bio.ed.ac.uk/Main_Page" target="_blank">official web page</a>.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate beast source file(s) using a machine that does have
Internet access and copy them into the `src/beast` directory on your Rocks
development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.

The build process requires the beagle libraries and assumes that the beagle
modulefile provided by the SDSC beagle-roll is available.  It will build without
the modulefile as long as the environment variables it provides are otherwise
defined.




## Building

To build the beast-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `beast-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

This roll source supports building with different compilers.
The `ROLLCOMPILER` make variable can be used to specify the name of compiler
modulefiles to use for building the software, e.g.,

```shell
% make ROLLCOMPILER=intel 2>&1 | tee build.log
```

The build process recognizes "gnu", "intel" or "pgi" as the value for the
`ROLLCOMPILER` variable.  The default value is "gnu".


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll beast
% cd /export/rocks/install
% rocks create distro
% rocks run roll beast | bash
```

In addition to the software itself, the roll installs BEAST environment module
files in:

```shell
/opt/modulefiles/applications/beast
```


## Testing

The beast-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To run
the test scripts execute the following command(s):

```shell
% /root/rolltests/beast.t 
```

