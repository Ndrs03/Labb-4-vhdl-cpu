LIBRARY ieee;
USE work.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY alu IS
    PORT (
        in_1, in_2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        result_add : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        result_mult : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        result_not : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        result_and : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        result_or : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END alu;

ARCHITECTURE behave OF alu IS
    
BEGIN
    add4 : ENTITY work.add4(behave) PORT MAP (in_1, in_2, result_add);
    mul4 : ENTITY work.mul4(behave) PORT MAP (in_1, in_2, result_mult);
    invrt4 : ENTITY work.invrt4(behave) PORT MAP (in_1, result_not);
    bit_and4 : ENTITY work.bit_and4(behave) PORT MAP (in_1, in_2, result_and);
    bit_or4 : ENTITY work.bit_or4(behave) PORT MAP (in_1, in_2, result_or);
END behave;