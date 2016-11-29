#!/usr/bin/perl

use warnings;
use strict;

use Tk;
use Tk::JPEG;
use Tk::PNG;

my @values = (1, 2, 3, 4, 5, 6, 7, 8, 9);
my @proc_values = (1, 2, 3, 4, 5, 6, 7, 8, 9);
my @img_array = (my $img_0, my $img_1, my $img_2, my $img_3, my $img_4, my $img_5, my $img_6, my $img_7, my $img_8, my $img_9);
our $check_value;
our $rand;

my $mw = new MainWindow(-title=>"Calculus", -width=>625, -height=>850);
my $pic_frm = $mw -> Frame(-width=>600, -height=>600) -> place(-x=>12, -y=>0);
my $canvas = $pic_frm -> Canvas(-width=>600, -height =>600) -> place(-x=>0, -y=>0);
my $op_frm = $mw -> Frame(-width=>625, -height=>250) -> place(-x=>0, -y=>600);

#main image loading
my $image = $canvas -> Photo(-file =>"src/rainbow.png") or die $!;

#tabs images
for(my $l=0; $l<=9; $l++) {
	$img_array[$l] = $mw -> Photo(-file=>"src/${l}.png") or die $!;
}

$canvas->createImage(300, 300, -image=>$image);
my @btn_array = ([my $btn11, my $btn12, my $btn13], [my $btn21, my $btn22, my $btn23], [my $btn31, my $btn32, my $btn33]);
for (my $i=0; $i <= 2; $i++) {
    for(my $j=0; $j <= 2; $j++) {
        $rand = int(rand(10));
        while ( !grep( /^$rand$/, @values) ) {
            $rand = int(rand(10));
        }
        @values = grep { $_ != $rand } @values;

		$btn_array[$i][$j] = $pic_frm -> Button(-text=>"$rand", -image=>$img_array[$rand], -font=>"-*-Helvetica-Bold-R-Normal-*-*-200-*-*-*-*-*-*", -height=>'195', -width=>'195', -command=>\&pushButton) -> place(-x=>($i*200), -y=>($j*200));
    }
}
my $lbl = $op_frm -> Label(-text=>"+", -font=>"-*-Helvetica-Bold-R-Normal-*-*-700-*-*-*-*-*-*") -> place(-x=>280, -y=>75);
my $lbl_op1 = $op_frm -> Label(-image=>$img_array[0], -background=>'white', -width=>200, -height=>200) -> place(-x=>50, -y=>20);
my $lbl_op2 = $op_frm -> Label(-image=>$img_array[0], -background=>'white', -width=>200, -height=>200) -> place(-x=>355, -y=>20);
my $btn_start = $op_frm -> Button(-text=>"START", -font=>"-*-Helvetica-Bold-R-Normal-*-*-200-*-*-*-*-*-*", -width=>'5', -command=>\&setUp) -> place(-x=>270, -y=>100);

MainLoop;

sub setUp {
	$btn_start -> placeForget();
	if(@proc_values) {
		#print "Line: ", __LINE__, "\n";
		$rand = int(rand(10));
		while ( !grep( /^$rand$/, @proc_values) ) {
			$rand = int(rand(10));
		}
		@proc_values = grep { $_ != $rand } @proc_values;
		$check_value = $rand;
		my $calc_rand1;
		my $calc_rand2;
		$calc_rand1 = int(rand($rand));
		if($calc_rand1 == 0) {
			$calc_rand1++;
		}
		$calc_rand2 = int(rand($rand));
		while( ($calc_rand1+$calc_rand2) != $rand ) {
			$calc_rand2 = int(rand($rand));
		}
		$lbl_op1 -> configure(-image=>$img_array[$calc_rand1]);
		$lbl_op2 -> configure(-image=>$img_array[$calc_rand2]);
	} else {
		$mw->configure(-title=>"WIN!!!");
	}
}

sub pushButton {
    my $btn = $Tk::widget;
    if($check_value eq int($btn->cget('-text'))) {
        $btn -> placeForget();
        &setUp;
    }
}