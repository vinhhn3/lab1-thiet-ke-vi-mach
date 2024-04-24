# Variables
GHDL=ghdl
SRC=$(wildcard src/*.vhd)
OBJ=$(SRC:.vhd=.o)
ENTITIES=$(basename $(notdir $(SRC)))

# Default target
all: elaborate

# Rule to compile VHDL files
%.o: %.vhd
	$(GHDL) -a $<

# Rule to elaborate the design
# Rule to elaborate the design
elaborate: $(OBJ)
	@echo "Entities: $(ENTITIES)"
	@$(foreach entity,$(ENTITIES),powershell -Command "$(GHDL) -e $(entity);" )

# Rule to clean the workspace
clean:
	$(GHDL) --clean
	rm -f $(OBJ)