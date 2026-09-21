library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu4 is
    Port (
        a      : in  STD_LOGIC_VECTOR(3 downto 0);
        b      : in  STD_LOGIC_VECTOR(3 downto 0);
        opcode : in  STD_LOGIC_VECTOR(1 downto 0);
        result : out STD_LOGIC_VECTOR(7 downto 0);
        carry  : out STD_LOGIC
    );
end alu4;

architecture Behavioral of alu4 is
begin

    process(a, b, opcode)
        variable temp : unsigned(7 downto 0);
    begin
        result <= (others => '0');
        carry  <= '0';
        temp   := (others => '0');

        case opcode is

            when "00" =>       -- TAMBAH
                temp := resize(unsigned(a), 8)
                      + resize(unsigned(b), 8);

                result <= std_logic_vector(temp);
                carry <= temp(4);

            when "01" =>       -- KURANG
                if unsigned(a) >= unsigned(b) then
                    temp := resize(unsigned(a), 8)
                         - resize(unsigned(b), 8);
                    carry <= '0';
                else
                    temp := resize(unsigned(a), 8)
                         - resize(unsigned(b), 8);
                    carry <= '1';
                end if;

                result <= std_logic_vector(temp);

            when "10" =>       -- KALI
                temp := resize(unsigned(a) * unsigned(b), 8);
                result <= std_logic_vector(temp);
                carry <= '0';

            when others =>
                result <= (others => '0');
                carry <= '0';

        end case;
    end process;

end Behavioral;