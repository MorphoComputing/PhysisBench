# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.221884775456473

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 1+2+16+17+18+19+60+73+74+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 20+47+71+76+120
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 59 and name CA, 2YXF and resi 75 and name CA  # target=27.499899999087912 current=38.61410817372706
color yellow, pair_00
distance pair_01, 2YXF and resi 16 and name CA, 2YXF and resi 88 and name CA  # target=27.499946679566538 current=38.03896423114129
color yellow, pair_01
distance pair_02, 2YXF and resi 17 and name CA, 2YXF and resi 88 and name CA  # target=27.499264402070946 current=37.827005712466274
color yellow, pair_02
distance pair_03, 2YXF and resi 58 and name CA, 2YXF and resi 75 and name CA  # target=27.499833394799055 current=37.8022975105453
color yellow, pair_03
distance pair_04, 2YXF and resi 59 and name CA, 2YXF and resi 74 and name CA  # target=27.49942576166358 current=37.59772397616488
color yellow, pair_04
distance pair_05, 2YXF and resi 16 and name CA, 2YXF and resi 89 and name CA  # target=27.49871814317531 current=37.21098494768131
color yellow, pair_05
distance pair_06, 2YXF and resi 19 and name CA, 2YXF and resi 88 and name CA  # target=27.499491189648325 current=36.99453277853775
color yellow, pair_06
distance pair_07, 2YXF and resi 1 and name CA, 2YXF and resi 19 and name CA  # target=27.49988327078656 current=36.95788485843016
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
