LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY mul4 IS -- m_out <= in_1 * in_2
    PORT (
        in_1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        in_2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        m_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END mul4;

ARCHITECTURE behave OF mul4 IS

BEGIN
    m_out <= in_1 * in_2;
END behave;
