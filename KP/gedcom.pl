#!/usr/bin/perl


my $FILENAME = 'family.txt';
open(my $FILE, '<', $FILENAME) 
or die "Could not open file '$FILENAME' $!";

my $ID;
my %NAME;
my %SEX;
my $HUSBAND;
my $WIFE;

while ($LINE = <$FILE>)
{	
	$LINE =~ tr/\r\n//d;
	if ($LINE =~ m/0 \@I([0-9]+)\@ INDI/){
		$ID = $1;
	}
	else{
		if ($LINE =~ m/1 NAME (.*) /){
			$NAME{$ID} = $1;
		}
		else{
			if ($LINE =~ m/2 (SURN) (.*)/){
				$NAME{$ID} = $2 . ' ' . $NAME{$ID};
			}
			else{
				if ($LINE =~ m/1 SEX (.)/){
					$SEX{$ID} = $1;	
					if ($SEX{$ID} eq 'F')
					{
						print "female('$NAME{$ID}').\n";
					}
				}
				else{

					
					if ($LINE =~ m/1 HUSB \@I([0-9]+)\@/)
					{
						$HUSBAND = $1;
					}
					if ($LINE =~ m/1 WIFE \@I([0-9]+)\@/)
					{
						$WIFE = $1;
					}

					else{
						if ($LINE =~ m/1 CHIL \@I([0-9]+)\@/)
						{
						print "father('$NAME{$HUSBAND}', '$NAME{$1}').\n";
						print "mother('$NAME{$WIFE}', '$NAME{$1}').\n";	
						}
					}
										
				}			
			}
		}
	}
}

close($FILE);
