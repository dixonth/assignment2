----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2020 06:11:47 PM
-- Design Name: 
-- Module Name: multiplexer3_1 - Behavioral
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

entity multiplexer3_1 is
    Port (            
           S : in  std_logic_vector (1 downto 0);
           left : in std_logic;
           right : in std_logic;
           transfer : in std_logic;
           H : out std_logic);
end multiplexer3_1;

architecture Behavioral of multiplexer3_1 is

begin

   process ( S, left, right, transfer)
		begin
		case  S is
			when "00" => H <= transfer;
			when "01" => H <= right;
			when "10" => H <= left;
			when others => H <= transfer;
		end case;
	end process;
	
end Behavioral;

