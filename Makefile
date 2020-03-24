.PHONY: all clean

.DEFAULT: all

all clean:
	$(MAKE) -C csse_covid_19_data/csse_covid_19_time_series $@

