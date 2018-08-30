# William Butler Program 5 April 9, 2003
#
# Version 1.0 : 
#
#! /usr/local/bin/perl -w
use strict;

my @files = glob "*";
my $files;
my $i=0;
my $dir=0;

my @isdir;
my $isdir;
print "Directory: ./\n";
print "Files: ";
while($files[$i]){
	opendir DH, "$files[$i]";
	while ($files = readdir DH){
		$isdir[$i]=1;
	}

	if (($isdir[$i]==0) && ($files[$i] ne "program5.pl")){
		print $files[$i]. " ";
	}
	closedir DH;
	$i++;
}
$i=0;
print"\n";
print "Directories: ";
while($files[$i]){
	opendir DH, "$files[$i]";
	while ($files = readdir DH){
		$isdir[$i]=1;
	}

	if ($isdir[$i]==1){
		print $files[$i]. " ";
		$dir++;
	}
	closedir DH;
	$i++;
}
print"\n";
