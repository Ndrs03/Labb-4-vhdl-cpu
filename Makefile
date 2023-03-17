GHDL = ghdl
FLAGS = -fsynopsys --std=08
INPUT_NAME = 4-bit_inverter
INPUT_NAME_2 = 4-bit_AND
INPUT_NAME_3 = 4-bit_OR
INPUT_NAME_4 = 4-bit_multiply
INPUT_NAME_5 = 4-bit_add
INPUT_NAME_6 = 4-bit_CU
INPUT_NAME_7 = alu
INPUT_NAME_8 = top_module
TESTBENCH_INPUT_NAME = testbench
TESTBENCH_ENTITY_NAME = testbench

all:
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME).vhdl
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME_2).vhdl
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME_3).vhdl
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME_4).vhdl
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME_5).vhdl
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME_6).vhdl
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME_7).vhdl
	@$(GHDL) -a $(FLAGS) $(INPUT_NAME_8).vhdl
	@$(GHDL) -a $(FLAGS) $(TESTBENCH_INPUT_NAME).vhdl
	@$(GHDL) -e $(FLAGS) $(TESTBENCH_ENTITY_NAME)
	@$(GHDL) -r $(FLAGS) $(TESTBENCH_ENTITY_NAME) --stop-time=60us --wave=wave.ghw

wave: # compile first
	gtkwave wave.ghw
