MODULE=bel1
ERL=/usr/bin/erl
ERLC=/usr/bin/erlc
ERLFLAGS=-pa $(BEAMDIR)
ERLCFLAGS=-o
BEAMDIR=./ebin

all:
	@ $(MAKE) clean compile test
clean:
	@ rm -rf $(BEAMDIR) ;
	@ rm -f erl_crash.dump
compile:
	@ mkdir -p $(BEAMDIR) ;		# Create .beam output dir
	@ $(ERLC) $(ERLCFLAGS) $(BEAMDIR) *.erl
test:
	@ $(ERL) $(ERLFLAGS) -noshell -eval 'eunit:test($(MODULE), [verbose])' -s init stop
shell:
	@ $(ERL) $(ERLFLAGS) --eval 'c:l($(MODULE))'
	
