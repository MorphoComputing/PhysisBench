# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.08135488720921454

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 1+12+13+14+15+16+18+29+51+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1MSI and resi 1 and name CA, 1MSI and resi 14 and name CA  # target=27.498961399485296 current=30.078842791575156
color yellow, pair_00
distance pair_01, 1MSI and resi 1 and name CA, 1MSI and resi 13 and name CA  # target=27.493253209946662 current=29.02453916678417
color yellow, pair_01
distance pair_02, 1MSI and resi 1 and name CA, 1MSI and resi 15 and name CA  # target=27.490431349682137 current=28.790274791504146
color yellow, pair_02
distance pair_03, 1MSI and resi 26 and name CA, 1MSI and resi 62 and name CA  # target=23.481610072046166 current=24.146585462455803
color yellow, pair_03
distance pair_04, 1MSI and resi 2 and name CA, 1MSI and resi 46 and name CA  # target=23.77232310239943 current=24.436074208715926
color yellow, pair_04
distance pair_05, 1MSI and resi 2 and name CA, 1MSI and resi 47 and name CA  # target=23.67892635324656 current=24.32120364484459
color yellow, pair_05
distance pair_06, 1MSI and resi 14 and name CA, 1MSI and resi 27 and name CA  # target=23.792359226759732 current=24.411442388353773
color yellow, pair_06
distance pair_07, 1MSI and resi 3 and name CA, 1MSI and resi 14 and name CA  # target=23.774970259237406 current=24.37968836811303
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
