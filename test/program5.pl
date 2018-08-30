# William Butler Program 5 April 9, 2003
#
# Version 1.0  
#
#! /usr/local/bin/perl -w
use strict;

my @files = glob "*";
my $files;
my $i=0;

my @isdir;
my $isdir;

###################################
sub dirstuff{
print "Directory: ./\n";
print "Files: ";
while($files[$i]){
	opendir DH, "$files[$i]";
	while ($files = readdir DH){
		$isdir[$i]=1;
	}
	if (($isdir[$i]==0) && ($files[$i] ne "program5.pl")){
		print $files[$i]. " ";
		$isdir[$i]=0; #??
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
		#$dir++;
	}
	closedir DH;
	$i++;
}
print"\n";
}
###################################


sub delname {
for(my $j=0;$j<$i;$j++){
	if ($files[$j]=="*.delete"){
		print "a";
		#unlink files[$j];
	}
	if ($files[$j]=="*.txt"){
		print "b";
		#rename files[$j];
	}
}
}
###################################
sub recurse{
print"\n";
for(my $j=0;$j<$i;$j++){
	if ($isdir[$j]==1){
		while($files[$j]){
		opendir DH, "$files[$j]";
		print "Directory: $files[$j]\n";
			while ($files[$j] = readdir DH){
				print "Filename: $files[$j]\n";	
			}
		closedir DH;
		print"\n";
		}
	}
}
}
###################################
sub changed{
for(my $j=0;$j<$i;$j++){
	if ($isdir[$j]==1){
		chdir "$files[$j]";
	}
}
}
###################################
for (my $z=0; $z<3; $z++){
	dirstuff;
	delname;
	recurse;
	changed;
}
