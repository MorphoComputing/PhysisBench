# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.0366097424605067

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 1+9+13+15+21+22+25+26+27+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1D0R and resi 6
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1D0R and resi 4 and name CA, 1D0R and resi 28 and name CA  # target=37.76027849352607 current=39.011295527744394
color yellow, pair_00
distance pair_01, 1D0R and resi 11 and name CA, 1D0R and resi 24 and name CA  # target=20.669349195441505 current=21.446825983141476
color yellow, pair_01
distance pair_02, 1D0R and resi 13 and name CA, 1D0R and resi 25 and name CA  # target=20.677466579824284 current=21.43355380723383
color yellow, pair_02
distance pair_03, 1D0R and resi 12 and name CA, 1D0R and resi 26 and name CA  # target=22.95517701799116 current=23.58640934914245
color yellow, pair_03
distance pair_04, 1D0R and resi 7 and name CA, 1D0R and resi 20 and name CA  # target=21.608826679343373 current=22.190652672573293
color yellow, pair_04
distance pair_05, 1D0R and resi 11 and name CA, 1D0R and resi 20 and name CA  # target=15.957051986594163 current=16.533071209282873
color yellow, pair_05
distance pair_06, 1D0R and resi 16 and name CA, 1D0R and resi 27 and name CA  # target=16.695088894137207 current=17.26040726251435
color yellow, pair_06
distance pair_07, 1D0R and resi 14 and name CA, 1D0R and resi 24 and name CA  # target=16.18307640021473 current=16.69867569441924
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
