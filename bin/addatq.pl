#!/usr/bin/perl
#
# Anime recording system foltia
# http://www.dcc-jpl.com/soft/foltia/
#
#addatq.pl
#
#TID�ȶ�ID��������atq�������
# addatq.pl <TID> <StationID> [DELETE]
# DELETE�ե饰���Ĥ��Ⱥ���Τ߹Ԥ�
#
# DCC-JPL Japan/foltia project
#
#

use strict;
use warnings;
use Carp;
use Getopt::Long;
use Foltia;

#�����������뤫?
GetOptions('-t=s' => \my $tid, '-s=s' => \my $station);

#�������ʤ��м¹Ԥ��줿�顢��λ
($tid || $station) or die "Usage: addatq.pl -t <TID> -s <StationID> [DELETE]\n";

my $f = new Foltia;
$f->video->addatq($tid, $station);
