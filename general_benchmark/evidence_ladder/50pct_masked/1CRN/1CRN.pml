# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.09609626369587407

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 14+17+18+19+20+33+35+36+39+40
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CRN and resi 18 and name CA, 1CRN and resi 38 and name CA  # target=26.857208815633584 current=26.243490206510568
color yellow, pair_00
distance pair_01, 1CRN and resi 20 and name CA, 1CRN and resi 42 and name CA  # target=23.78713892389566 current=24.338250633880488
color yellow, pair_01
distance pair_02, 1CRN and resi 17 and name CA, 1CRN and resi 41 and name CA  # target=26.782862100238898 current=26.261400305554567
color yellow, pair_02
distance pair_03, 1CRN and resi 21 and name CA, 1CRN and resi 41 and name CA  # target=23.644821555955197 current=24.16055725676892
color yellow, pair_03
distance pair_04, 1CRN and resi 18 and name CA, 1CRN and resi 43 and name CA  # target=23.391483975093838 current=23.870486196854756
color yellow, pair_04
distance pair_05, 1CRN and resi 19 and name CA, 1CRN and resi 42 and name CA  # target=26.80679591071312 current=26.35761877364783
color yellow, pair_05
distance pair_06, 1CRN and resi 18 and name CA, 1CRN and resi 44 and name CA  # target=24.058593262585617 current=24.504772252808387
color yellow, pair_06
distance pair_07, 1CRN and resi 20 and name CA, 1CRN and resi 40 and name CA  # target=23.55684380794016 current=23.978193123654094
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
