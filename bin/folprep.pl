#!/usr/bin/perl
#
# Anime recording system foltia
# http://www.dcc-jpl.com/soft/foltia/
#
#folprep.pl
#
#at����ƤФ�ơ���Ū���Ȥ�����Ƥ��ʤ�����ǧ���ޤ�
#���������ǻ��郎15ʬ�ʾ���ʤ����folprep�Υ��塼������ޤ�
#���ǻ��郎15ʬ����ʤ����ǻ����Ͽ�襭�塼������ޤ�
#
#����:PID
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
$pid or die "Usage: folprep.pl <PID>\n";

#PIDõ��

#���塼������
Foltia::Util::writelog("folprep addpidatq $pid");
my $f = new Foltia;
$f->db->addpidatq($pid);


