#!/usr/bin/perl

use warnings;
use strict;

use Tk;
use Tk::JPEG;
use Tk::PNG;

my @values = (1, 2, 3, 4, 5, 6, 7, 8, 9);
my @proc_values = (1, 2, 3, 4, 5, 6, 7, 8, 9);
#my @img_array = (my $img_1, my $img_2, my $img_3, my $img_4, my $img_5, my $img_6, my $img_7, my $img_8, my $img_9);
our $check_value;
our $rand;

my $mw = new MainWindow(-title=>"Calculus", -width=>625, -height=>850);
my $pic_frm = $mw -> Frame(-width=>600, -height=>600) -> place(-x=>12, -y=>0);
my $canvas = $pic_frm -> Canvas(-width=>600, -height =>600) -> place(-x=>0, -y=>0);
my $op_frm = $mw -> Frame(-width=>625, -height=>250) -> place(-x=>0, -y=>600);

#main image loading
my $image = $canvas -> Photo(-file =>"src/rainbow.png") or die $!;

#tabs images
my $img_0 = $mw -> Photo(-file =>"src/0.png") or die $!;
my $img_1 = $mw -> Photo(-file =>"src/1.png") or die $!;
my $img_2 = $mw -> Photo(-file =>"src/2.png") or die $!;
my $img_3 = $mw -> Photo(-file =>"src/3.png") or die $!;
my $img_4 = $mw -> Photo(-file =>"src/4.png") or die $!;
my $img_5 = $mw -> Photo(-file =>"src/5.png") or die $!;
my $img_6 = $mw -> Photo(-file =>"src/6.png") or die $!;
my $img_7 = $mw -> Photo(-file =>"src/7.png") or die $!;
my $img_8 = $mw -> Photo(-file =>"src/8.png") or die $!;
my $img_9 = $mw -> Photo(-file =>"src/9.png") or die $!;

$canvas->createImage(300, 300, -image=>$image);
my @btn_array = ([my $btn11, my $btn12, my $btn13], [my $btn21, my $btn22, my $btn23], [my $btn31, my $btn32, my $btn33]);
for (my $i=0; $i <= 2; $i++) {
    for(my $j=0; $j <= 2; $j++) {
        $rand = int(rand(10));
        while ( !grep( /^$rand$/, @values) ) {
            $rand = int(rand(10));
        }
        @values = grep { $_ != $rand } @values;

        $btn_array[$i][$j] = $pic_frm -> Button(-text=>"$rand", -image=>$img_1, -font=>"-*-Helvetica-Bold-R-Normal-*-*-200-*-*-*-*-*-*", -height=>'195', -width=>'195', -command=>\&pushButton) -> place(-x=>($i*200), -y=>($j*200));
		if($rand eq 1) {
			$btn_array[$i][$j] -> configure(-image=>$img_1);
		} elsif($rand eq 2) {
			$btn_array[$i][$j] -> configure(-image=>$img_2);
		} elsif($rand eq 3) {
			$btn_array[$i][$j] -> configure(-image=>$img_3);
		} elsif($rand eq 4) {
			$btn_array[$i][$j] -> configure(-image=>$img_4);
		} elsif($rand eq 5) {
			$btn_array[$i][$j] -> configure(-image=>$img_5);
		} elsif($rand eq 6) {
			$btn_array[$i][$j] -> configure(-image=>$img_6);
		} elsif($rand eq 7) {
			$btn_array[$i][$j] -> configure(-image=>$img_7);
		} elsif($rand eq 8) {
			$btn_array[$i][$j] -> configure(-image=>$img_8);
		} elsif($rand eq 9) {
			$btn_array[$i][$j] -> configure(-image=>$img_9);
		} else {
		}
    }
}
my $lbl = $op_frm -> Label(-text=>"+", -font=>"-*-Helvetica-Bold-R-Normal-*-*-700-*-*-*-*-*-*") -> place(-x=>280, -y=>75);
my $lbl_op1 = $op_frm -> Label(-image=>$img_0, -background=>'white', -width=>200, -height=>200) -> place(-x=>50, -y=>20);
my $lbl_op2 = $op_frm -> Label(-image=>$img_0, -background=>'white', -width=>200, -height=>200) -> place(-x=>355, -y=>20);
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
		if($calc_rand1 eq 1) {
			$lbl_op1 -> configure(-image=>$img_1);
		} elsif($calc_rand1 eq 2) {
			$lbl_op1 -> configure(-image=>$img_2);
		} elsif($calc_rand1 eq 3) {
			$lbl_op1 -> configure(-image=>$img_3);
		} elsif($calc_rand1 eq 4) {
			$lbl_op1 -> configure(-image=>$img_4);
		} elsif($calc_rand1 eq 5) {
			$lbl_op1 -> configure(-image=>$img_5);
		} elsif($calc_rand1 eq 6) {
			$lbl_op1 -> configure(-image=>$img_6);
		} elsif($calc_rand1 eq 7) {
			$lbl_op1 -> configure(-image=>$img_7);
		} elsif($calc_rand1 eq 8) {
			$lbl_op1 -> configure(-image=>$img_8);
		} elsif($calc_rand1 eq 9) {
			$lbl_op1 -> configure(-image=>$img_9);
		} else {
			$lbl_op1 -> configure(-image=>$img_0);
		}
		if($calc_rand2 eq 1) {
			$lbl_op2 -> configure(-image=>$img_1);
		} elsif($calc_rand2 eq 2) {
			$lbl_op2 -> configure(-image=>$img_2);
		} elsif($calc_rand2 eq 3) {
			$lbl_op2 -> configure(-image=>$img_3);
		} elsif($calc_rand2 eq 4) {
			$lbl_op2 -> configure(-image=>$img_4);
		} elsif($calc_rand2 eq 5) {
			$lbl_op2 -> configure(-image=>$img_5);
		} elsif($calc_rand2 eq 6) {
			$lbl_op2 -> configure(-image=>$img_6);
		} elsif($calc_rand2 eq 7) {
			$lbl_op2 -> configure(-image=>$img_7);
		} elsif($calc_rand2 eq 8) {
			$lbl_op2 -> configure(-image=>$img_8);
		} elsif($calc_rand2 eq 9) {
			$lbl_op2 -> configure(-image=>$img_9);
		} else {
			$lbl_op2 -> configure(-image=>$img_0);
		}
	} else {
		#$lbl->configure(-text=>"WIN!");
		$mw->configure(-title=>"WIN!!!");
	}
}

sub pushButton {
    my $btn = $Tk::widget;
    if($check_value eq int($btn->cget('-text'))) {
        $btn -> placeForget();
        for (my $i=0; $i <= 2; $i++) {
            for(my $j=0; $j <= 2; $j++) {
                $btn_array[$i][$j] -> configure(-foreground=>'black');
            }
        }
        &setUp;
    } else {
        $btn -> configure(-foreground=>'red');
    }
}