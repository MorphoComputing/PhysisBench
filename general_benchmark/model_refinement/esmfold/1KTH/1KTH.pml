# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0839471524983542

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 1+12+13+14+15+16+25+37+38+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KTH and resi 1 and name CA, 1KTH and resi 56 and name CA  # target=17.20443595592735 current=13.092457803752014
color yellow, pair_00
distance pair_01, 1KTH and resi 1 and name CA, 1KTH and resi 55 and name CA  # target=15.827646179045813 current=11.905287547465571
color yellow, pair_01
distance pair_02, 1KTH and resi 13 and name CA, 1KTH and resi 56 and name CA  # target=27.43427494738401 current=30.666792645458372
color yellow, pair_02
distance pair_03, 1KTH and resi 14 and name CA, 1KTH and resi 56 and name CA  # target=27.456606843608444 current=30.440664523237775
color yellow, pair_03
distance pair_04, 1KTH and resi 1 and name CA, 1KTH and resi 52 and name CA  # target=16.49626900965049 current=14.251040445230595
color yellow, pair_04
distance pair_05, 1KTH and resi 1 and name CA, 1KTH and resi 54 and name CA  # target=12.344645675499194 current=10.13427323300482
color yellow, pair_05
distance pair_06, 1KTH and resi 1 and name CA, 1KTH and resi 53 and name CA  # target=12.68894439602091 current=10.499587793149196
color yellow, pair_06
distance pair_07, 1KTH and resi 1 and name CA, 1KTH and resi 51 and name CA  # target=16.894402354390436 current=14.732029310801508
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
