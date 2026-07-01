# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.2262400619946929

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 5+13+14+15+25+26+27+61+86+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 21
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 28 and name CA, 1TIT and resi 87 and name CA  # target=27.499999999506457 current=37.969018374572435
color yellow, pair_00
distance pair_01, 1TIT and resi 27 and name CA, 1TIT and resi 87 and name CA  # target=27.49999999892991 current=37.378143866406575
color yellow, pair_01
distance pair_02, 1TIT and resi 25 and name CA, 1TIT and resi 87 and name CA  # target=27.499999996640767 current=36.39986954791401
color yellow, pair_02
distance pair_03, 1TIT and resi 29 and name CA, 1TIT and resi 87 and name CA  # target=27.499999943194325 current=35.44651528130988
color yellow, pair_03
distance pair_04, 1TIT and resi 76 and name CA, 1TIT and resi 87 and name CA  # target=27.499999890136458 current=35.12811499210862
color yellow, pair_04
distance pair_05, 1TIT and resi 27 and name CA, 1TIT and resi 86 and name CA  # target=27.499999879616848 current=34.79900950220765
color yellow, pair_05
distance pair_06, 1TIT and resi 1 and name CA, 1TIT and resi 15 and name CA  # target=27.499999511246266 current=34.76585681637157
color yellow, pair_06
distance pair_07, 1TIT and resi 1 and name CA, 1TIT and resi 13 and name CA  # target=27.499999586443018 current=34.319705624005984
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
