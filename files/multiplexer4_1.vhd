----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2020 06:11:47 PM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer4_1 is
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
           opAND : in  std_logic;
           opOR : in  std_logic;
           opXOR : in  std_logic;
           opNOT : in  std_logic;
           z : out  std_logic);
end multiplexer4_1;

architecture Behavioral of multiplexer4_1 is

begin

   process ( S, opAND, opOR, opXOR, opNOT)
		begin
		case  S is
			when "00" => z <= opAND;
			when "01" => z <= opOR;
			when "10" => z <= opXOR;
			when "11" => z <= opNOT;
			when others => z <= opAND;
		end case;
	end process;
	
end Behavioral;

