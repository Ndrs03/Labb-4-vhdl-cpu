LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit_or4 IS -- o_out <= ( in_1 OR in in_2 )
    PORT (
        in_1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        in_2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END bit_or4;

ARCHITECTURE behave OF bit_or4 IS

BEGIN
    o_out <= in_1 OR in_2;
END behave;