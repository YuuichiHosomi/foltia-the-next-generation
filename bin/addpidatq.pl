#!/usr/bin/perl
#
# Anime recording system foltia
# http://www.dcc-jpl.com/soft/foltia/
#
#addpidatq.pl
#
#PID�������atq������롣folprep.pl���饭�塼�����ϤΤ���˻Ȥ���
#
# DCC-JPL Japan/foltia project
#
#
use strict;
use warnings;
use Carp;
use Getopt::Long;
use Foltia;


GetOptions('-p=s' => \my $pid)

#�������ʤ��м¹Ԥ��줿�顢��λ
$pid or die "Usage: addpidatq.pl -p <PID>\n";

my $f = new Foltia;
$f->db->addpidatq($pid);
