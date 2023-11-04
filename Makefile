.PHONY: all reload compile clean

all: compile

compile: rebar3
	./rebar3 get-deps compile

reload: compile
	zsh -c './reload.erl $$(foreach f (src/*.erl); basename $$f .erl; end)'

rebar3:
	wget -c https://s3.amazonaws.com/rebar3/rebar3
	chmod +x $@

clean: rebar3
	./rebar3 clean
