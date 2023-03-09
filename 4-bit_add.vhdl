LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY add4 IS -- s_out <= ( ’0 ’ & in_1 ) + ( ’0 ’ & in_2 )
    PORT (
        in_1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        in_2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        s_out : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
        );
END add4;

ARCHITECTURE behave OF add4 IS

BEGIN
    s_out <= ('0' & in_1) + ('0' & in_2);
END behave;