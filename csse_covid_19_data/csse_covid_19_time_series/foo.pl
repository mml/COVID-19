#!/usr/bin/perl

$ROWS=50;
$headers = <>;
$counts = <>;
chomp $counts;
@counts = split /,/, $counts;
$max = 1;
foreach $count (@counts) {
  if ($count > $max) { $max = $count }
}
$size = int($max / $ROWS)+1;
for (reverse (1..$ROWS)) {
  for $count (@counts) {
    if ($count >= $_ * $size) {
      printf "| ";
    } elsif ($count >= ($_-0.33) * $size) {
      printf ": ";
    } elsif ($count >= ($_-0.67) * $size) {
      printf ". ";
    } else {
      printf "  ";
    }
  }
  printf "\n";
}
