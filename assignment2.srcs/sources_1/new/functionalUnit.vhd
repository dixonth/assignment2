----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2020 07:09:58 PM
-- Design Name: 
-- Module Name: functionalUnit - Behavioral
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

entity functionalUnit is
Port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Gsel : in std_logic_vector(3 downto 0);
        MF : in std_logic;
        H : in std_logic_vector(1 downto 0);
        F : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end functionalUnit;

architecture Behavioral of functionalUnit is

COMPONENT arithmeticLogicUnit is
Port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        S : in std_logic_vector(2 downto 0);
        Cin : in std_logic;
        G : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end COMPONENT arithmeticLogicUnit;

COMPONENT shifter is
   Port (
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end COMPONENT shifter;

COMPONENT MUXf is
    Port ( S : in std_logic;
           ALU : in  std_logic_vector (15 downto 0);
           shift : in  std_logic_vector (15 downto 0);
           z : out  std_logic_vector (15 downto 0));
end COMPONENT MUXf;

signal ALUresult, shiftResult : std_logic_vector(15 downto 0);

begin

ALU: arithmeticLogicUnit PORT MAP(
        A => A,
        B => B,
        S => Gsel(3 downto 1),
        Cin => Gsel(0),
        G => ALUresult,
        Cout => Cout
);

shift: shifter PORT MAP(
        src_B => B,
        S0 => H(0),
        S1 => H(1),
        result => shiftResult
);

MFselect: MUXf PORT MAP(
        S => MF,
        ALU => ALUresult,
        shift => shiftResult,
        z => F
);

end Behavioral;
