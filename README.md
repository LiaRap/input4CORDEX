# input4CORDEX
Example codes to create forcing files 3hourly for ORCHIDEE starting from CORDEX dataset contained in /bdd/CORDEX/output/ (CMIP5). Each year takes less than 5 minutes.

The forcing files are stored in /modfs/project/input4CORDEX/output/

The files path follows the same structure as in /bdd/CORDEX/output/, given by

-CORDEX domain
-GCM
-scenario
-ensemble member
-RCM
-version
-frequency

If you want to create new forcings, you will have to apport the following modifications to the script:

-modify the parameters mentioned above in the script section "INPUT PATH", paying attention to also modify in the line "forcing_in" the acronym for the RCM (for ex if the RCM is'DMI-HIRHAM5' in the path you put /DMI/).
For the European domain EUR-11, the acronyms are the following

CEC  CLMcom  CLMcom-BTU  CLMcom-ETH  CNRM  DHMZ  DMI  GERICS  ICTP  IPSL  KNMI	MOHC  MPI-CSC  PIK  RMIB-UGent	SMHI  UHOH

#add the others if you work with other domains

-change the years that you want in the section "TIME RANGE DEFINITION"

- change the mask file in section "MASK CALL". Each domain has a specific grid file.
  
N.B. I remind you that when running ORCHIDEE with these forcing files, you need to specify the grid file:
  a) in PARAM/run.def, add the line GRID_FILE = gridfile.nc
  b) in the COMP/orchideedriver.card: ListNonDel= (/path/to/your/grid/name_grid_file.nc, gridfile.nc)

For the moment, only the geogrid for EUR-11 is provided, but you can create others with the geogrid package accessible at github https://gitlab.in2p3.fr/ipsl/lmd/intro/gengeogrid.
If you work with grids created with this package, according to teh ORCHIDEE version you are using, you would need to specify the calendar of the forcing files in the PARAM/run.def, adding the line
WRF_CALENDAR = 360d (or whatever the calendar is) after the line GRID_FILE = gridfile.nc. If you do not put anything the default will be "standard", but pay attention because some models have a different calendar. (ASK JAN) 
  
- when the full path to call the variable is defined, in the section "VARIABLES CALL", each variable directory contains one of more subdirectories with the dataset corresponding to different updates in the dataset. You can check the name in the corresponding /bdd/CORDEX/output directory, and change it in the line version_2 (eventually version_3, version_4 ecc, because sometimes different variables have different updates) in section "INPUT PATH".

-averaged variables (rsds, rlds, pr) and instantaneus variables (the others) are associated to different timesteps, so that the "time part" (HH_1s ecc) in the name of the input file is different between these two groups. Please check that these values correspond to the name of your files, if not, modify accordingly. Not all models follow the same rules.

-accori

