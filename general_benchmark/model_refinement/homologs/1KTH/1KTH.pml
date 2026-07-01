# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5656642178171354

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 1+2+3+14+15+38+48+52+55+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KTH and resi 14 and name CA, 1KTH and resi 27 and name CA  # target=27.081625451033037 current=28.530234500018164
color yellow, pair_00
distance pair_01, 1KTH and resi 13 and name CA, 1KTH and resi 27 and name CA  # target=26.9591655649609 current=28.22413381868963
color yellow, pair_01
distance pair_02, 1KTH and resi 14 and name CA, 1KTH and resi 52 and name CA  # target=26.9137864732332 current=28.145825645956172
color yellow, pair_02
distance pair_03, 1KTH and resi 13 and name CA, 1KTH and resi 52 and name CA  # target=26.86431896280011 current=28.008345089961868
color yellow, pair_03
distance pair_04, 1KTH and resi 14 and name CA, 1KTH and resi 26 and name CA  # target=26.936964692485795 current=27.918987846856968
color yellow, pair_04
distance pair_05, 1KTH and resi 15 and name CA, 1KTH and resi 25 and name CA  # target=26.835675949419592 current=27.802910404727328
color yellow, pair_05
distance pair_06, 1KTH and resi 15 and name CA, 1KTH and resi 27 and name CA  # target=26.770022391481085 current=27.729902180503807
color yellow, pair_06
distance pair_07, 1KTH and resi 14 and name CA, 1KTH and resi 25 and name CA  # target=26.913141753417584 current=27.85700066883961
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
