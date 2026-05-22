LIBENGINE=project2-bin/libengine.a
LIBRUNNER=project2-bin/librunner.a

CC=cc
CFLAGS=
LDFLAGS=

all: client.a server.a

# C
# Create executables by linking the static libraries
client: $(LIBRUNNER) client.a
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

server: server.a $(LIBENGINE)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# Create static libraries from .o files
client.a: client_c/client.o
	rm -f $@
	ar rcs $@ $^

server.a: server_c/server.o
	rm -f $@
	ar rcs $@ $^

# Rule to compile any .o file
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@