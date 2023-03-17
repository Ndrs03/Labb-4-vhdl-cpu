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
    clk <= NOT clk AFTER 100 ns;

    cpu : ENTITY work.cpu(behave) PORT MAP (ax, opcode, clk, update);

    PROCESS
        VARIABLE ax_loop, opcode_loop : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    BEGIN -- process
        update <= '1';
        FOR ax_loop IN 0 TO 15 LOOP
            ax <= conv_std_logic_vector(ax_loop, 4);
            FOR opcode_loop IN 0 TO 15 LOOP
                opcode <= conv_std_logic_vector(opcode_loop, 4);
                WAIT FOR 200 ns;
            END LOOP;
        END LOOP;

    END PROCESS;
END behave;