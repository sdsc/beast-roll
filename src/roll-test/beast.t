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

# beast-install.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'beast installed');
} else {
  ok(! $isInstalled, 'beast not installed');
}
SKIP: {

  `mkdir -p $TESTFILE.dir`;
  skip 'beast not installed', 4 if ! $isInstalled;
  $output = `cd $TESTFILE.dir;. /etc/profile.d/modules.sh;module load beast/1.8.0; beast /opt/beast/1.8.0/examples/Benchmarks/old_benchmark.xml 2>&1`;
  ok($output =~ /total operations\s*=\s*\d+/, 'beast 1.8 benchmark run');
  skip 'modules not installed', 3 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/beast/[0-9]* 2>&1`;
  ok($? == 0, 'beast module installed');
  `/bin/ls /opt/modulefiles/applications/beast/.version.[0-9]* 2>&1`;
  ok($? == 0, 'beast version module installed');
  ok(-l '/opt/modulefiles/applications/beast/.version',
     'beast version module link created');
   `rm -rf $TESTFILE.dir`;
}
