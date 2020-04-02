----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2020 05:00:01 PM
-- Design Name: 
-- Module Name: reg16 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg16 is
    port ( D : in std_logic_vector(15 downto 0);
            load, Clk : in std_logic;
            Q : out std_logic_vector(15 downto 0));
end reg16;

architecture Behavioral of reg16 is
begin

    process(Clk)
    begin
        if (rising_edge(Clk)) then
            if load='1' then
                Q<=D after 5 ns;
            end if;
        end if;
    end process;
end Behavioral;
