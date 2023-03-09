LIBRARY ieee;
USE work.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cpu IS
    PORT (
        ax, opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        clk, update : IN STD_LOGIC;
        A, B, C, D : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END cpu;

ARCHITECTURE behave OF cpu IS
    SIGNAL wire_add : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL wire_mul : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL wire_not : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL wire_and : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL wire_or : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL wire_op_in1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL wire_op_in2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    
BEGIN

    CU : ENTITY work.cu(behave) PORT MAP (
        clk => clk,
        update => update,
        ax => ax,
        opcode => opcode,
        result_add => wire_add,
        result_mult => wire_mul,
        result_not => wire_not,
        result_and => wire_and,
        result_or => wire_or,
        A => A,
        B => B,
        C => C,
        D => D,
        op_in1 => wire_op_in1,
        op_in2 => wire_op_in2
        );

    ALU : ENTITY work.alu(behave) PORT MAP (
        in_1 => wire_op_in1,
        in_2 => wire_op_in2,
        result_add => wire_add,
        result_mult => wire_mul,
        result_not => wire_not,
        result_and => wire_and,
        result_or => wire_or
        );

END behave;