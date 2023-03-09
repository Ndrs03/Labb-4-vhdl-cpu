LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit_and4 IS -- a_out <= ( in_1 AND in_2 )
    PORT (
        in_1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        in_2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        a_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END bit_and4;

ARCHITECTURE behave OF bit_and4 IS

BEGIN
    a_out <= in_1 AND in_2;
END behave;
