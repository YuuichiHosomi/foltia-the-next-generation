#!/usr/bin/perl
#
# Anime recording system foltia
# http://www.dcc-jpl.com/soft/foltia/
#
#usage ;mklocalizeddir.pl [TID]
# Mac OS X Localized�ե����ޥåȤ˽�򤷤���¤��Ͽ��ǥ��쥯�ȥ���롣
# ����:[Mac OS X 10.2�Υ����饤����ǽ] http://msyk.net/macos/jaguar-localize/
#
# DCC-JPL Japan/foltia project
#
#
use strict;
use warnings;
use Carp;
use Getopt::Long;
use Foltia;


GetOptions('-t=s' => \my $tid)

#�����������뤫?	#�������ʤ��м¹Ԥ��줿�顢��λ
$tid or die "Usage: mklocalizeddir.pl [TID]\n";

my $f = new Foltia;
$f->video->mklocalizeddir($tid);
