#!/usr/bin/perl
#usage captureimagemaker.pl  MPEG2filename
#
# Anime recording system foltia
# http://www.dcc-jpl.com/soft/foltia/
#
#
# ����ץ�����������⥸�塼��
# recwrap.pl����ƤӽФ���롣
#
# DCC-JPL Japan/foltia project
#

use strict;
use warnings;
use Carp;
use Getopt::Long;
use Foltia;

GetOptions('-f=s' => \my $filename);
my ($tid, $countno, $date, $time)
    = Foltia::Util::capture_image_filename_parse($filename);

#�������ʤ��м¹Ԥ��줿�顢��λ
$tid or die "Usage: captureimagemaker.pl  MPEG2filename\n";

if ($tid < 0) {
    my $msg = "captureimagemaker TID invalid";
    Foltia::Util::writelog($msg);
    die $msg, "\n";
}

my $f = new Foltia;

#��Ͽ��ե����뤬���뤫�����å�
my $file = srpintf('%s/%s', $f->config->{recfolderpath}, $filename);
if (! -e $file){
    my $msg = "captureimagemaker notexist $file";
	Foltia::Util::writelog($msg);
    die $msg;
}

# Ÿ����ǥ��쥯�ȥ꤬���뤫��ǧ

my $capimgdirname = $f->config->{recfolderpath} . "/" . "$tid.localized/";
#�ʤ���к��
if (! -e $capimgdirname ){
    #FIXME!
	system("$toolpath/perl/mklocalizeddir.pl $tid");
	Foltia::Util::writelog("captureimagemaker mkdir $capimgdirname");
}

$capimgdirname .= '/img';
#�ʤ���к��
if (! -e $capimgdirname ){
	mkdir $capimgdirname, 0777;
	Foltia::Util::writelog("captureimagemaker mkdir $capimgdirname");
}


# ����ץ��������ǥ��쥯�ȥ���� 
# $captureimgdir = "$tid"."-"."$countno"."-"."$date"."-"."$time";
my $captureimgdir = $filename;
$captureimgdir =~ s/\.m2p$//; 

if (! -e "$capimgdirname/$captureimgdir"){
	mkdir "$capimgdirname/$captureimgdir" ,0777;
	Foltia::Util::writelog("captureimagemaker mkdir $capimgdirname/$captureimgdir");

}

# �Ѵ�
#system ("mplayer -ss 00:00:10 -vo jpeg:outdir=$capimgdirname/$captureimgdir/ -vf crop=702:468:6:6,scale=160:120,pp=lb -ao null -sstep 14 -v 3 $recfolderpath/$filename");

#system ("mplayer -ss 00:00:10 -vo jpeg:outdir=$capimgdirname/$captureimgdir/ -vf crop=702:468:6:6,scale=160:120 -ao null -sstep 14 -v 3 $recfolderpath/$filename");


#��ETV�Ȥ��������뤫�麸�����⤦�������Ť��ڤ���
#system ("mplayer -ss 00:00:10 -vo jpeg:outdir=$capimgdirname/$captureimgdir/ -vf crop=690:460:12:10,scale=160:120 -ao null -sstep 14 -v 3 $recfolderpath/$filename");

#��10�ä��Ȥ�
system ("mplayer -ss 00:00:10 -vo jpeg:outdir=$capimgdirname/$captureimgdir/ -vf crop=690:460:12:10,scale=160:120 -ao null -sstep 9 -v 3 $recfolderpath/$filename");

