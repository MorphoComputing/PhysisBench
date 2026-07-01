# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.07957786355038664

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 14+17+18+19+33+36+37+38+41+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CRN and resi 18 and name CA, 1CRN and resi 41 and name CA  # target=27.49237115933607 current=28.877710050070338
color yellow, pair_00
distance pair_01, 1CRN and resi 18 and name CA, 1CRN and resi 38 and name CA  # target=26.857208815633584 current=26.160172551537396
color yellow, pair_01
distance pair_02, 1CRN and resi 20 and name CA, 1CRN and resi 42 and name CA  # target=23.78713892389566 current=24.38938828394738
color yellow, pair_02
distance pair_03, 1CRN and resi 21 and name CA, 1CRN and resi 41 and name CA  # target=23.644821555955197 current=24.22733557891351
color yellow, pair_03
distance pair_04, 1CRN and resi 17 and name CA, 1CRN and resi 41 and name CA  # target=26.782862100238898 current=26.22249795352968
color yellow, pair_04
distance pair_05, 1CRN and resi 20 and name CA, 1CRN and resi 40 and name CA  # target=23.55684380794016 current=24.082844331400413
color yellow, pair_05
distance pair_06, 1CRN and resi 18 and name CA, 1CRN and resi 43 and name CA  # target=23.391483975093838 current=23.859060872171884
color yellow, pair_06
distance pair_07, 1CRN and resi 19 and name CA, 1CRN and resi 42 and name CA  # target=26.80679591071312 current=26.354726287283864
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
