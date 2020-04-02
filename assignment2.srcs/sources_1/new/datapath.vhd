----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/11/2020 12:43:34 PM
-- Design Name:
-- Module Name: datapath - Behavioral
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

entity datapath is
Port (     --datapath
           constIn : in std_logic_vector(15 downto 0);
           MBsel : in std_logic;
           dataIn : in std_logic_vector(15 downto 0);
           MDsel : in std_logic;

           --functionalUnit
--           A : in std_logic_vector(15 downto 0);
--           B : in std_logic_vector(15 downto 0);
           FS : in std_logic_vector(4 downto 0);
--           H : in std_logic_vector(1 downto 0);

           --registerFile
           Aaddr : in std_logic_vector(2 downto 0); 
           Baddr : in std_logic_vector(2 downto 0); 
           dest : in std_logic_vector(2 downto 0);
           enable : in std_logic;
           Clock : in std_logic; 
--           data_src : in std_logic;
--           data : in std_logic_vector(15 downto 0);

            r0 : out std_logic_vector(15 downto 0); 
            r1 : out std_logic_vector(15 downto 0); 
            r2 : out std_logic_vector(15 downto 0);  
            r3 : out std_logic_vector(15 downto 0);  
            r4 : out std_logic_vector(15 downto 0);  
            r5 : out std_logic_vector(15 downto 0);  
            r6 : out std_logic_vector(15 downto 0); 
            r7 : out std_logic_vector(15 downto 0); 

           --out
           AdrOutA : out  STD_LOGIC_VECTOR (15 downto 0);
           AdrOutB : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC);

end datapath;

architecture Behavioral of datapath is

COMPONENT functionalUnit is
Port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Gsel : in std_logic_vector(3 downto 0);
        MF : in std_logic;
        H : in std_logic_vector(1 downto 0);
        F : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end COMPONENT functionalUnit;

COMPONENT registerFile is
Port (  srcA : in std_logic_vector(2 downto 0); --------------------------
        srcB : in std_logic_vector(2 downto 0); ---------------------------
        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;
        Clk : in std_logic;          ---------------------------------
        write : in std_logic;        ---------------------------------
--        data_src : in std_logic;
--        data : in std_logic_vector(15 downto 0);
        FUout : in std_logic_vector(15 downto 0); -------------------------------

        reg0 : out std_logic_vector(15 downto 0); -------------------------------
        reg1 : out std_logic_vector(15 downto 0); -------------------------------
        reg2 : out std_logic_vector(15 downto 0); -------------------------------
        reg3 : out std_logic_vector(15 downto 0); -------------------------------
        reg4 : out std_logic_vector(15 downto 0); -------------------------------
        reg5 : out std_logic_vector(15 downto 0); -------------------------------
        reg6 : out std_logic_vector(15 downto 0); -------------------------------
        reg7 : out std_logic_vector(15 downto 0); -------------------------------
        Adata : out std_logic_vector(15 downto 0);
        Bdata : out std_logic_vector(15 downto 0));

end COMPONENT registerFile;

COMPONENT multi2_1 is
    Port (     data_src : in  STD_LOGIC;
               src_reg : in  STD_LOGIC_VECTOR (15 downto 0);
               data_in : in  STD_LOGIC_VECTOR (15 downto 0);
               z : out  STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT multi2_1;

signal Awire, Bwire, Bbus, FUresult, result : std_logic_vector(15 downto 0); -------------------------------


begin

MUXB: multi2_1 PORT MAP(
        data_src => MBsel,
        src_reg => Bwire,
        data_in => constIn,
        z => Bbus
);

MUXD: multi2_1 PORT MAP(
        data_src => MDsel,
        src_reg => FUresult,
        data_in => dataIn,
        z => result
);

RF: registerFile PORT MAP(
        srcA => Aaddr,
        srcB => Baddr,
        des_A0 => dest(2),
        des_A1 => dest(1),
        des_A2 => dest(0),
        Clk => Clock,
        write => enable,
--        data_src => data_src,
--        data => data,
        FUout => result,

        reg0 => r0,
        reg1 => r1,
        reg2 => r2,
        reg3 => r3,
        reg4 => r4,
        reg5 => r5,
        reg6 => r6,
        reg7 => r7,
        Adata => Awire,
        Bdata => Bwire
);

FU: functionalUnit PORT MAP(
        A => Awire,
        B => Bbus,
        Gsel => FS(3 downto 0),
        MF => FS(4),
        H => FS(3 downto 2),
        F => FUresult,
        Cout => C
);

AdrOutA <= Awire;
AdrOutB <= Bbus;

end Behavioral;
