CONFIRMED = time_series_19-covid-Confirmed.csv
CSVTOOL = $(HOME)/.opam/default/bin/csvtool
INDIANA = indiana-confirmed.csv
CALIFORNIA = california-confirmed.csv
NY = ny-confirmed.csv
STATES = $(INDIANA) $(CALIFORNIA) $(NY)

.PHONY: indiana california ny clean

.DEFAULT: all

$(warning $(patsubst %-confirmed.csv,%-graph.txt,$(STATES)))

all: $(STATES) $(STATES:%-confirmed.csv=%-graph.txt)

califorina: $(CALIFORNIA)

indiana: $(INDIANA)

ny: $(NY)

clean:
	rm -f $(STATES)

%-uncollated.csv: $(CONFIRMED) %.pat
	($(CSVTOOL) take 1 $< ; egrep '$(shell cat $*.pat)' $<) | $(CSVTOOL) col 5- - > $@

%-confirmed.csv: %-uncollated.csv
	($(CSVTOOL) take 1 $< ; $(CSVTOOL) drop 1 $< | perl -F, -lane 'for (0..$$#F) { $$sum[$$_] += $$F[$$_] }; END { @delta = (0); for (1..$$#sum) { push @delta, $$sum[$$_ - 1] == 0 ? 0 : $$sum[$$_] / $$sum[$$_ - 1] }; print STDOUT join(",", @sum), "\n", join(",", @delta) }') > $@

%-graph.txt: %-confirmed.csv
	perl foo.pl $< > $@
