#!/usr/bin/perl
#
# Anime recording system foltia
# http://www.dcc-jpl.com/soft/foltia/
#
#
#deletemovie.pl
#
#�ե�����̾�������ꡢ��������򤹤�
#�Ȥꤢ������./mita/�ذ�ư
#
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
GetOptions('-f=s' => \my $file);

#�������ʤ��м¹Ԥ��줿�顢��λ
$file or die "Usage: deletemovie.pl <FILENAME>\n";

my $f = new Foltia;
$f->video->deletemovie($file);
