----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 07:55:41 PM
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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

entity shifter_tb is
--  Port ( );
end shifter_tb;

architecture Behavioral of shifter_tb is

COMPONENT shifter is
   Port (
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end COMPONENT shifter;

--in
        signal src_B :  std_logic_vector(15 downto 0):= (others => '0');
        signal S0 :  std_logic:= '0';
        signal S1 :  std_logic:= '0';
--out
        signal result :  std_logic_vector(15 downto 0):= (others => '0');

begin

uut: shifter PORT MAP (
          src_B => src_B,
          S0 => S0,
          S1 => S1,
          result => result
        );

stim_proc: process
   begin
      src_B <= x"0001";

      wait for 10 ns;	
      S0 <= '0';
      S1 <= '0';  
        
      wait for 10 ns;	
      S0 <= '0';
      S1 <= '1';
      
      wait for 10 ns;	
      S0 <= '1';
      S1 <= '0';
      
end process;
end Behavioral;
