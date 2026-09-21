library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu4 is
end tb_alu4;

architecture Behavioral of tb_alu4 is

    signal a      : STD_LOGIC_VECTOR(3 downto 0);
    signal b      : STD_LOGIC_VECTOR(3 downto 0);
    signal opcode : STD_LOGIC_VECTOR(1 downto 0);
    signal result : STD_LOGIC_VECTOR(7 downto 0);
    signal carry  : STD_LOGIC;

begin

    uut: entity work.alu4
        port map (
            a      => a,
            b      => b,
            opcode => opcode,
            result => result,
            carry  => carry
        );

    process
    begin

        -- 7 + 1 = 8
        a <= "0111";
        b <= "0001";
        opcode <= "00";
        wait for 10 ns;

        assert result = "00001000"
            report "ERROR: 7 + 1 salah"
            severity error;

        -- 5 - 3 = 2
        a <= "0101";
        b <= "0011";
        opcode <= "01";
        wait for 10 ns;

        assert result = "00000010"
            report "ERROR: 5 - 3 salah"
            severity error;

        -- 3 x 2 = 6
        a <= "0011";
        b <= "0010";
        opcode <= "10";
        wait for 10 ns;

        assert result = "00000110"
            report "ERROR: 3 x 2 salah"
            severity error;

        -- 15 x 15 = 225
        a <= "1111";
        b <= "1111";
        opcode <= "10";
        wait for 10 ns;

        assert result = "11100001"
            report "ERROR: 15 x 15 salah"
            severity error;

        report "SIMULASI SELESAI"
            severity note;

        wait;

    end process;

end Behavioral;