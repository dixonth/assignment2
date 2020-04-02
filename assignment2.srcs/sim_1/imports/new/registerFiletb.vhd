----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2020 09:57:51 AM
-- Design Name: 
-- Module Name: registerFiletb - Behavioral
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

entity registerFiletb is
--  Port ( );
end registerFiletb;

architecture Behavioral of registerFiletb is

-- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    Port ( srcA : in std_logic_vector(2 downto 0);
            srcB : in std_logic_vector(2 downto 0);
            des_A0 : in std_logic;
            des_A1 : in std_logic;
            des_A2 : in std_logic;
            Clk : in std_logic;
            write : in std_logic;
--            data_src : in std_logic;
--            data : in std_logic_vector(15 downto 0);
            FUout : in std_logic_vector(15 downto 0);
            reg0 : out std_logic_vector(15 downto 0);
            reg1 : out std_logic_vector(15 downto 0);
            reg2 : out std_logic_vector(15 downto 0);
            reg3 : out std_logic_vector(15 downto 0);
            reg4 : out std_logic_vector(15 downto 0);
            reg5 : out std_logic_vector(15 downto 0);
            reg6 : out std_logic_vector(15 downto 0);
            reg7 : out std_logic_vector(15 downto 0);
            Adata : out std_logic_vector(15 downto 0);
            Bdata : out std_logic_vector(15 downto 0));
end component;

--Inputs
   signal srcA : std_logic_vector(2 downto 0) := (others => '0');
   signal srcB : std_logic_vector(2 downto 0) := (others => '0');
   signal des_A0 : std_logic := '0';
   signal des_A1 : std_logic := '0';
   signal des_A2 : std_logic := '0';
--   signal data_src : std_logic := '0';
   signal write : std_logic := '0';
   signal Clk : std_logic := '0';
--   signal data : std_logic_vector(15 downto 0) := (others => '0');
   signal FUout : std_logic_vector(15 downto 0) := (others => '0');
   

 	--Outputs
   signal reg0 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg1 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg2 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg3 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg4 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg5 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg6 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg7 : std_logic_vector(15 downto 0) := (others => '0');
   signal Adata : std_logic_vector(15 downto 0) := (others => '0');
   signal Bdata : std_logic_vector(15 downto 0) := (others => '0');
   
   
   --Clk
   constant Clk_period : time := 5 ns;

begin
-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          srcA => srcA,
          srcB => srcB,
            des_A0 => des_A0,
            des_A1 => des_A1,
            des_A2 => des_A2,
            Clk => Clk,
            write => write,
--            data_src => data_src,
--            data => data,
            FUout => FUout,
            reg0 => reg0,
            reg1 => reg1,
            reg2 => reg2,
            reg3 => reg3,
            reg4 => reg4,
            reg5 => reg5,
            reg6 => reg6,
            reg7 => reg7,
            Adata => Adata,
            Bdata => Bdata
        );

    process begin
        wait for Clk_period;
          Clk <= not Clk;
    end process;

   stim_proc: process
   begin		
      wait for Clk_period*2;
      
      write <= '1';
--      data_src <= '0';
      des_A0 <= '0';
      des_A1 <= '0';
      des_A2 <= '0';
	  FUout <= x"0000";
	  
	  wait for Clk_period*2;
	  
	  des_A0 <= '0';
      des_A1 <= '0';
      des_A2 <= '1';
	  FUout <= x"1111";
	  
--	  wait for Clk_period*2;
	  
--	  srcA <= "000";
      srcB <= "001";
      
      wait for Clk_period*2;
	  
	  des_A0 <= '0';
      des_A1 <= '0';
      des_A2 <= '0';
	  FUout <= x"5555";
	  
	  wait for Clk_period*2;
	  
	  des_A0 <= '0';
      des_A1 <= '0';
      des_A2 <= '1';
	  FUout <= x"6666";
	  
	  wait for Clk_period*2;
	  
----      data_src <= '1';
--      des_A0 <= '0';
--      des_A1 <= '1';
--      des_A2 <= '0';
--	  Fuout <= x"2222";
	  
--	  wait for Clk_period*2;
      
--      des_A0 <= '0';
--      des_A1 <= '1';
--      des_A2 <= '1';
--	  FUout <= x"3333";
	  
--	  wait for Clk_period*2;
      
--      des_A0 <= '1';
--      des_A1 <= '0';
--      des_A2 <= '0';
--	  FUout <= x"4444";
	  
--	  wait for Clk_period*2;
      
--      des_A0 <= '1';
--      des_A1 <= '0';
--      des_A2 <= '1';
--	  FUout <= x"5555";
	  
--	  wait for Clk_period*2;
      
--      des_A0 <= '1';
--      des_A1 <= '1';
--      des_A2 <= '0';
--	  FUout <= x"6666";
	  
--	  wait for Clk_period*2;
      
--      des_A0 <= '1';
--      des_A1 <= '1';
--      des_A2 <= '1';
--	  FUout <= x"7777";
	  
--	  wait for Clk_period*2;
	  
--	  write <= '0';
	  
--      srcA <= "000";
--      srcB <= "111";
      
--      wait for Clk_period*2;
	  
--	  srcA <= "010";
--      srcB <= "001";
      
--      wait for Clk_period*2;
	  
--      srcA <= "011";
--      srcA <= "100";
      
--      wait for Clk_period*2;
	  
      
--      wait;
   end process;

end Behavioral;
