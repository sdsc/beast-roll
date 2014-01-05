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

Unknown at this time.


## Building

To build the beast-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `beast-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.


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
/opt/modulefiles/applications/.(compiler)/beast.
```


## Testing

The beast-roll includes a test script which can be run to verify proper
installation of the beast-roll documentation, binaries and module files. To run
the test scripts execute the following command(s):

```shell
% /root/rolltests/beast.t 
ok 1 - beast is installed
ok 2 - beast test run
ok 3 - beast module installed
ok 4 - beast version module installed
ok 5 - beast version module link created
1..5
```

