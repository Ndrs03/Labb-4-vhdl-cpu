LIBRARY ieee;
USE work.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY cu IS
    PORT (
        clk : IN STD_LOGIC;
        update : IN STD_LOGIC;
        ax : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        result_add : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        result_mult : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        result_not : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        result_and : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        result_or : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        A : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        C : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        D : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        op_in1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        op_in2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END cu;

ARCHITECTURE behave OF cu IS
    SIGNAL BX, CX, DX : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk)
    BEGIN

        IF rising_edge(clk) THEN
            IF update = '1' THEN
                CASE opcode IS
                    WHEN "0000" =>
                        BX <= AX;
                    WHEN "0001" =>
                        CX <= AX;
                    WHEN "0010" =>
                        DX <= BX;
                    WHEN "0011" =>
                        BX <= "0000";
                    WHEN "0100" =>
                        CX <= "0000";
                    WHEN "0101" =>
                        DX <= "0000";
                    WHEN "0110" => --test add
                        op_in1 <= "0010";
                        op_in2 <= "0011";
                    WHEN "0111" => --test mul
                        op_in1 <= "0010";
                        op_in2 <= "0011";
                    WHEN "1000" => --test inv
                        op_in1 <= "0010";
                    WHEN "1001" => --test and
                        op_in1 <= "0010";
                        op_in2 <= "0011";
                    WHEN "1010" => --test or
                        op_in1 <= "0010";
                        op_in2 <= "0011";
                    WHEN "1011" => --AX + BX
                        op_in1 <= AX;
                        op_in2 <= BX;
                    WHEN "1100" => --AX * BX
                        op_in1 <= AX;
                        op_in2 <= BX;
                    WHEN "1101" => --NOT(AX)
                        op_in1 <= AX;
                    WHEN "1110" => --AX AND BX
                        op_in1 <= AX;
                        op_in2 <= BX;
                    WHEN "1111" => --AX OR BX
                        op_in1 <= AX;
                        op_in2 <= BX;
                    WHEN OTHERS =>
                END CASE;
            END IF;
        ELSIF falling_edge(clk) THEN
            CASE opcode IS
                WHEN "0110" => --test add
                    CX <= result_add(3 DOWNTO 0);
                    DX <= "0101";
                WHEN "0111" => --test mul
                    CX <= result_mult(3 DOWNTO 0);
                    DX <= "0110";
                WHEN "1000" => --test inv
                    CX <= result_not(3 DOWNTO 0);
                    DX <= "1101";
                WHEN "1001" => --test and
                    CX <= result_and(3 DOWNTO 0);
                    DX <= "0010";
                WHEN "1010" => --test or
                    CX <= result_or(3 DOWNTO 0);
                    DX <= "0011";
                WHEN "1011" => --AX + BX
                    DX <= "000" & result_add(4);
                    CX <= result_add(3 DOWNTO 0);
                WHEN "1100" => --AX + BX
                    DX <= result_mult(7 DOWNTO 4);
                    CX <= result_mult(3 DOWNTO 0);
                WHEN "1101" => --NOT(AX)
                    DX <= "0000";
                    CX <= result_not(3 DOWNTO 0);
                WHEN "1110" => --AX AND BX
                    DX <= "0000";
                    CX <= result_and(3 DOWNTO 0);
                WHEN "1111" => --AX OR BX
                    DX <= "0000";
                    CX <= result_or(3 DOWNTO 0);
                WHEN OTHERS =>
            END CASE;
        END IF;
        A <= AX;
        B <= BX;
        C <= CX;
        D <= DX;
    END PROCESS;

END behave;