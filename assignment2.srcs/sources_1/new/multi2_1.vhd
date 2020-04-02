----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2020 06:50:20 PM
-- Design Name: 
-- Module Name: multi2_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multi2_1 is
    Port (     data_src : in  STD_LOGIC;
               src_reg : in  STD_LOGIC_VECTOR (15 downto 0);
               data_in : in  STD_LOGIC_VECTOR (15 downto 0);
               
               z : out  STD_LOGIC_VECTOR (15 downto 0));
end multi2_1;

architecture Behavioral of multi2_1 is

begin
    process ( data_src, src_reg, data_in)
		begin
		case  data_src is
			when '0' => z <= src_reg;
			when '1' => z <= data_in;
			when others => z <= src_reg;
		end case;
	end process;

end Behavioral;
