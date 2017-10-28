----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2017 01:39:39 PM
-- Design Name: 
-- Module Name: mem_bram - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_bram is
    Generic( mem_depth : INTEGER := 8;
             word_width : INTEGER := 4;
             addr_width : INTEGER := 3);
    Port ( we_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (word_width-1 downto 0);
           addr_in : in STD_LOGIC_VECTOR (addr_width-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (word_width-1 downto 0));
end mem_bram;

architecture Behavioral of mem_bram is
type memory_type is array (0 to mem_depth-1) of std_logic_vector (word_width-1 downto 0);
signal RAM : memory_type;
signal addr : std_logic_vector (addr_width-1 downto 0) := addr_in;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (we_in = '1') then
                RAM(conv_integer(addr)) <= data_in;
            end if;
            data_out <= RAM(conv_integer(addr));
        end if;
    end process;

end Behavioral;
