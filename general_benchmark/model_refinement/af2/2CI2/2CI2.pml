# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.49042419700755485

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 1+36+37+38+39+40+41+53+54+59
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CI2 and resi 1 and name CA, 2CI2 and resi 53 and name CA  # target=27.368805933427897 current=30.24249649458116
color yellow, pair_00
distance pair_01, 2CI2 and resi 1 and name CA, 2CI2 and resi 54 and name CA  # target=27.304507077670625 current=29.696174079304583
color yellow, pair_01
distance pair_02, 2CI2 and resi 22 and name CA, 2CI2 and resi 37 and name CA  # target=26.57182916589786 current=27.467740157011722
color yellow, pair_02
distance pair_03, 2CI2 and resi 41 and name CA, 2CI2 and resi 54 and name CA  # target=26.730471379814418 current=27.623904410574063
color yellow, pair_03
distance pair_04, 2CI2 and resi 44 and name CA, 2CI2 and resi 54 and name CA  # target=26.643514015828444 current=27.47145179154128
color yellow, pair_04
distance pair_05, 2CI2 and resi 4 and name CA, 2CI2 and resi 62 and name CA  # target=5.048483748387588 current=4.288034657807949
color yellow, pair_05
distance pair_06, 2CI2 and resi 42 and name CA, 2CI2 and resi 54 and name CA  # target=26.527216404565607 current=27.263397827470335
color yellow, pair_06
distance pair_07, 2CI2 and resi 19 and name CA, 2CI2 and resi 41 and name CA  # target=23.459258042563558 current=24.13875447711723
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
