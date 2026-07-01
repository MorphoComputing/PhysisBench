# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5670886987944573

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 13+14+15+17+33+40+41+42+43+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SHG and resi 16 and name CA, 1SHG and resi 46 and name CA  # target=5.18569730323164 current=4.410001210966046
color yellow, pair_00
distance pair_01, 1SHG and resi 37 and name CA, 1SHG and resi 46 and name CA  # target=5.0998547634379054 current=4.365269517711674
color yellow, pair_01
distance pair_02, 1SHG and resi 7 and name CA, 1SHG and resi 21 and name CA  # target=5.082064323015874 current=4.349425940416886
color yellow, pair_02
distance pair_03, 1SHG and resi 3 and name CA, 1SHG and resi 54 and name CA  # target=5.090746535910669 current=4.358933902954205
color yellow, pair_03
distance pair_04, 1SHG and resi 8 and name CA, 1SHG and resi 20 and name CA  # target=5.018472148228604 current=4.325466890992001
color yellow, pair_04
distance pair_05, 1SHG and resi 1 and name CA, 1SHG and resi 13 and name CA  # target=23.31127843776568 current=23.971574962892074
color yellow, pair_05
distance pair_06, 1SHG and resi 27 and name CA, 1SHG and resi 38 and name CA  # target=5.271550533097874 current=4.624704784147346
color yellow, pair_06
distance pair_07, 1SHG and resi 10 and name CA, 1SHG and resi 18 and name CA  # target=5.175394052720043 current=4.5379004278476875
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
