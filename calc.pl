#!/usr/bin/perl

use warnings;
use strict;

use Tk;

my @values = (1, 2, 3, 4, 5, 6, 7, 8, 9);
my @proc_values = (1, 2, 3, 4, 5, 6, 7, 8, 9);
our $check_value;
our $rand;

my $mw = new MainWindow(-title=>"Calculus");
my $pic_frm = $mw -> Frame(-background=>'white') -> grid(-row=>'0', -column=>'0');
my @btn_array = ([my $btn11, my $btn12, my $btn13], [my $btn21, my $btn22, my $btn23], [my $btn31, my $btn32, my $btn33]);
for (my $i=0; $i <= 2; $i++) {
    for(my $j=0; $j <= 2; $j++) {
        $rand = int(rand(10));
        while ( !grep( /^$rand$/, @values) ) {
            $rand = int(rand(10));
        }
        @values = grep { $_ != $rand } @values;

        $btn_array[$i][$j] = $pic_frm -> Button(-text=>"$rand", -font=>"-*-Helvetica-Bold-R-Normal-*-*-200-*-*-*-*-*-*", -height=>'3', -width=>'5', -command=>\&pushButton) -> grid(-row=>$i, -column=>$j);
    }
}
my $lbl = $mw -> Label(-text=>"test", -font=>"-*-Helvetica-Bold-R-Normal-*-*-200-*-*-*-*-*-*") -> grid(-row=>'1', -column=>'0');
my $btn_start = $mw -> Button(-text=>"START", -font=>"-*-Helvetica-Bold-R-Normal-*-*-200-*-*-*-*-*-*", -width=>'5', -command=>\&setUp) -> grid(-row=>'2', -column=>'0');

MainLoop;

sub setUp {
#    print "Line: ", __LINE__, "\n";
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
    $lbl -> configure(-text=>"${calc_rand1} + ${calc_rand2}");
}

sub pushButton {
    my $btn = $Tk::widget;
    if($check_value eq int($btn->cget('-text'))) {
        $btn -> gridForget();
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
