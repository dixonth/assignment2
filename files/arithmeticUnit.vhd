----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 02:52:01 PM
-- Design Name: 
-- Module Name: arithmeticUnit - Behavioral
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

entity arithmeticUnit is
   Port (
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end arithmeticUnit;

architecture Behavioral of arithmeticUnit is

COMPONENT arithmetic 
    port(S0 : in std_logic;
         S1 : in std_logic;
         B  : in std_logic;
         Y  : out std_logic
         );
end COMPONENT;


begin

    bit0: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(0),
        Y => result(0)
    );
    
    bit1: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(1),
        Y => result(1)
    );
    
    bit2: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(2),
        Y => result(2)
    );
    
    bit3: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(3),
        Y => result(3)
    );
    
    bit4: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(4),
        Y => result(4)
    );
    
    bit5: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(5),
        Y => result(5)
    );
    
    bit6: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(6),
        Y => result(6)
    );
    
    bit7: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(7),
        Y => result(7)
    );
    
    bit8: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(8),
        Y => result(8)
    );
    
    bit9: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(9),
        Y => result(9)
    );
    
    bit10: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(10),
        Y => result(10)
    );
    
    bit11: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(11),
        Y => result(11)
    );
    
    bit12: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(12),
        Y => result(12)
    );
    
    bit13: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(13),
        Y => result(13)
    );
    
    bit14: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(14),
        Y => result(14)
    );
    
    bit15: arithmetic PORT MAP(
        S0 => S0,
        S1 => S1,
        B => src_B(15),
        Y => result(15)
    );


end Behavioral;
