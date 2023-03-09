LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY invrt4 IS -- i_out <= NOT ( in_1 )
    PORT (
        in_1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END invrt4;

ARCHITECTURE behave OF invrt4 IS

BEGIN
    i_out <= NOT(in_1);
END behave;