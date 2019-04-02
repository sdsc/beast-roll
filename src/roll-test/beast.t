#!/usr/bin/perl -w
# beast roll installation test.  Usage:
# beast.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/beast';
my $output;

my $TESTFILE = 'tmpbeast';
my @VERSIONS = ('1.8.0','1.8.1','1.8.2','1.10.4');

# beast-install.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'beast installed');
} else {
  ok(! $isInstalled, 'beast not installed');
}
SKIP: {
  skip 'beast not installed', 4 if ! $isInstalled;
  `mkdir -p $TESTFILE.dir`;
  foreach my $VERSION(@VERSIONS) {
     $output = `module load beast/$VERSION; cd $TESTFILE.dir; beast /opt/beast/$VERSION/examples/Benchmarks/old_benchmark.xml 2>&1`;
     ok($output =~ /Final likelihood/, 'beast $VERSION benchmark run');
     `rm -f $TESTFILE.dir/*`;
     }
  skip 'modules not installed', 3 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/beast/[0-9]* 2>&1`;
  ok($? == 0, 'beast module installed');
  `/bin/ls /opt/modulefiles/applications/beast/.version.[0-9]* 2>&1`;
  ok($? == 0, 'beast version module installed');
  ok(-l '/opt/modulefiles/applications/beast/.version',
     'beast version module link created');
  `rm -rf $TESTFILE.dir`;
}
