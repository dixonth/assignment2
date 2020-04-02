----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2020 06:11:47 PM
-- Design Name: 
-- Module Name: MUXf - Behavioral
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

entity MUXf is
    Port ( S : in std_logic;
           ALU : in  std_logic_vector (15 downto 0);
           shift : in  std_logic_vector (15 downto 0);
           z : out  std_logic_vector (15 downto 0));
end MUXf;

architecture Behavioral of MUXf is

begin

   process ( S, ALU, shift)
		begin
		case  S is
			when '0' => z <= ALU;
			when '1' => z <= shift;
			when others => z <= ALU;
		end case;
	end process;
	
end Behavioral;

