# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.042591453880697946

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 1+12+14+15+16+25+27+37+38+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KTH and resi 14 and name CA, 1KTH and resi 56 and name CA  # target=27.499993684162284 current=32.92403928505022
color yellow, pair_00
distance pair_01, 1KTH and resi 13 and name CA, 1KTH and resi 56 and name CA  # target=27.49997738708943 current=32.229612166170405
color yellow, pair_01
distance pair_02, 1KTH and resi 15 and name CA, 1KTH and resi 56 and name CA  # target=27.499911688112512 current=31.458119829208048
color yellow, pair_02
distance pair_03, 1KTH and resi 12 and name CA, 1KTH and resi 56 and name CA  # target=27.498526568950325 current=29.865455369390382
color yellow, pair_03
distance pair_04, 1KTH and resi 14 and name CA, 1KTH and resi 55 and name CA  # target=27.496552234029608 current=29.404066054253597
color yellow, pair_04
distance pair_05, 1KTH and resi 1 and name CA, 1KTH and resi 14 and name CA  # target=27.49431005926986 current=29.100215051401857
color yellow, pair_05
distance pair_06, 1KTH and resi 14 and name CA, 1KTH and resi 27 and name CA  # target=27.491686344161042 current=28.881736776712753
color yellow, pair_06
distance pair_07, 1KTH and resi 13 and name CA, 1KTH and resi 55 and name CA  # target=27.490495840610627 current=28.850766896509022
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
