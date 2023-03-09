LIBRARY IEEE;
USE work.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behave OF testbench IS
    SIGNAL clk, update : STD_LOGIC := '0';
    SIGNAL ax, opcode : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    clk <= not clk after 100 ns;
    
    cpu : ENTITY work.cpu(behave) PORT MAP (ax, opcode, clk, update);
    PROCESS
    BEGIN -- process
        update <= '1';
        ax <= "0010";
        opcode <= "0000";
        WAIT FOR 200 ns;

        ax <= "0011";
        opcode <= "1011";
        WAIT FOR 200 ns;

    END PROCESS;
END behave;