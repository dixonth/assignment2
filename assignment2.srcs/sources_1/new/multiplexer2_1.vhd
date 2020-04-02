----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2020 06:11:47 PM
-- Design Name: 
-- Module Name: multiplexer2_1 - Behavioral
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

entity multiplexer2_1 is
    Port ( S : in std_logic;
           arith : in  std_logic_vector (15 downto 0);
           log : in  std_logic_vector (15 downto 0);
           z : out  std_logic_vector (15 downto 0));
end multiplexer2_1;

architecture Behavioral of multiplexer2_1 is

begin

   process ( S, arith, log)
		begin
		case  S is
			when '0' => z <= arith;
			when '1' => z <= log;
			when others => z <= arith;
		end case;
	end process;
	
end Behavioral;

