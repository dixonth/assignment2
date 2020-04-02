----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 02:52:01 PM
-- Design Name: 
-- Module Name: arithmetic - Behavioral
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

entity arithmetic is
    port(S0 : in std_logic;
         S1 : in std_logic;
         B  : in std_logic;
         Y  : out std_logic
         );
end arithmetic;

architecture Behavioral of arithmetic is

signal notB, BS0, notBS1 : std_logic;

begin
    BS0 <= (B and S0) after 1ns;
    notB <= (not B) after 1ns;
    notBS1 <= (notB and S1) after 1ns;
    Y <= (BS0 or notBS1) after 1ns;

end Behavioral;
