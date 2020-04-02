----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 02:52:01 PM
-- Design Name: 
-- Module Name: logicUnit - Behavioral
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

entity logicUnit is
   Port (
        src_A : in std_logic_vector(15 downto 0);
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end logicUnit;

architecture Behavioral of logicUnit is

COMPONENT logic 
    port(S0 : in std_logic;
         S1 : in std_logic;
         A  : in std_logic;
         B  : in std_logic;
         Y  : out std_logic
         );
end COMPONENT;


begin

    bit0: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(0),
        B => src_B(0),
        Y => result(0)
    );
    
    bit1: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(1),
        B => src_B(1),
        Y => result(1)
    );
    
    bit2: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(2),
        B => src_B(2),
        Y => result(2)
    );
    
    bit3: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(3),
        B => src_B(3),
        Y => result(3)
    );
    
    bit4: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(4),
        B => src_B(4),
        Y => result(4)
    );
    
    bit5: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(5),
        B => src_B(5),
        Y => result(5)
    );
    
    bit6: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(6),
        B => src_B(6),
        Y => result(6)
    );
    
    bit7: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(7),
        B => src_B(7),
        Y => result(7)
    );
    
    bit8: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(8),
        B => src_B(8),
        Y => result(8)
    );
    
    bit9: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(9),
        B => src_B(9),
        Y => result(9)
    );
    
    bit10: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(10),
        B => src_B(10),
        Y => result(10)
    );
    
    bit11: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(11),
        B => src_B(11),
        Y => result(11)
    );
    
    bit12: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(12),
        B => src_B(12),
        Y => result(12)
    );
    
    bit13: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(13),
        B => src_B(13),
        Y => result(13)
    );
    
    bit14: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(14),
        B => src_B(14),
        Y => result(14)
    );
    
    bit15: logic PORT MAP(
        S0 => S0,
        S1 => S1,
        A => src_A(15),
        B => src_B(15),
        Y => result(15)
    );


end Behavioral;
