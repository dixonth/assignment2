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

entity multiplexer is
    Port ( src : in  STD_LOGIC_VECTOR (2 downto 0);
           in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           in3 : in  STD_LOGIC_VECTOR (15 downto 0);
           in4 : in  STD_LOGIC_VECTOR (15 downto 0);
           in5 : in  STD_LOGIC_VECTOR (15 downto 0);
           in6 : in  STD_LOGIC_VECTOR (15 downto 0);
           in7 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is

begin

   process ( src,in1,in2,in3,in4)
		begin
		case  src is
			when "000" => z <= in0;
			when "001" => z <= in1;
			when "010" => z <= in2;
			when "011" => z <= in3;
			when "100" => z <= in4;
			when "101" => z <= in5;
			when "110" => z <= in6;
			when "111" => z <= in7;
			when others => z <= in1;
		end case;
	end process;
	
end Behavioral;

