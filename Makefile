CARGO ?= cargo
BINARY = netwoRk

DEBUG_BINARY := target/debug/$(BINARY)
RELEASE_BINARY := target/release/$(BINARY)

all: release

debug:
	$(CARGO) build
	cp $(DEBUG_BINARY) ./$(BINARY)

release:
	$(CARGO) build --release
	cp $(RELEASE_BINARY) ./$(BINARY)

run: debug
	./$(BINARY) $(ARGS)

test:
	$(CARGO) test

clean:
	$(CARGO) clean
	@rm -f ./$(BINARY)

fclean: clean

re: fclean all

.PHONY: all debug release run clean fclean re test
