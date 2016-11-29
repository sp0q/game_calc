#!/usr/bin/perl

use warnings;
use strict;

use Tk;

my @values = (1, 2, 3, 4, 5, 6, 7, 8, 9);

my $mw = new MainWindow(-title=>"Calculus");
my $pic_frm = $mw -> Frame(-background=>'white') -> grid(-row=>'0', -column=>'0');
my @btn_array = ([my $btn11, my $btn12, my $btn13], [my $btn21, my $btn22, my $btn23], [my $btn31, my $btn32, my $btn33]);
for (my $i=0; $i <= 2; $i++) {
    for(my $j=0; $j <= 2; $j++) {
        my $rand = int(rand(10));
        while ( !grep( /^$rand$/, @values) ) {
            $rand = int(rand(10));
        }
        @values = grep { $_ != $rand } @values;

        $btn_array[$i][$j] = $pic_frm -> Button(-text=>"$rand", -font=>"-*-Helvetica-Bold-R-Normal-*-*-300-*-*-*-*-*-*", -height=>'3', -width=>'5', -command=>\&pushButton) -> grid(-row=>$i, -column=>$j);
    }
}
my $lbl = $mw -> Label(-text=>"test", -font=>"-*-Helvetica-Bold-R-Normal-*-*-300-*-*-*-*-*-*") -> grid(-row=>'1', -column=>'0');

MainLoop;

sub pushButton {
    my $btn = $Tk::widget;
    #$btn -> configure(-text=>"hello"); 
    $btn -> gridForget(); 
}
