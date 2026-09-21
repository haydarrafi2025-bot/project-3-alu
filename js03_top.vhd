library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity js03_top is
    Port (
        sw  : in  STD_LOGIC_VECTOR(15 downto 0);
        led : out STD_LOGIC_VECTOR(15 downto 0)
    );
end js03_top;

architecture Behavioral of js03_top is

    signal result_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal carry_sig  : STD_LOGIC;

begin

    ALU_INST : entity work.alu4
        port map (
            a      => sw(3 downto 0),
            b      => sw(7 downto 4),
            opcode => sw(15 downto 14),
            result => result_sig,
            carry  => carry_sig
        );

    led(7 downto 0) <= result_sig;
    led(8)          <= carry_sig;

    led(15 downto 9) <= (others => '0');

end Behavioral;