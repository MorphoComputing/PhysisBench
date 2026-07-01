# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4547134180289067

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 3+5+6+8+9+22+24+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1PT4 and resi 4+23
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1PT4 and resi 1 and name CA, 1PT4 and resi 27 and name CA  # target=14.266697070662278 current=7.922920329568268
color yellow, pair_00
distance pair_01, 1PT4 and resi 2 and name CA, 1PT4 and resi 27 and name CA  # target=16.00117379076184 current=10.827084762871317
color yellow, pair_01
distance pair_02, 1PT4 and resi 11 and name CA, 1PT4 and resi 27 and name CA  # target=17.58184465753187 current=14.154072451259085
color yellow, pair_02
distance pair_03, 1PT4 and resi 10 and name CA, 1PT4 and resi 27 and name CA  # target=19.354939235730697 current=16.272288291498345
color yellow, pair_03
distance pair_04, 1PT4 and resi 12 and name CA, 1PT4 and resi 27 and name CA  # target=17.727291443519686 current=14.855242887397768
color yellow, pair_04
distance pair_05, 1PT4 and resi 1 and name CA, 1PT4 and resi 26 and name CA  # target=13.909421267306493 current=11.502060952547351
color yellow, pair_05
distance pair_06, 1PT4 and resi 2 and name CA, 1PT4 and resi 26 and name CA  # target=16.046514548180216 current=13.906499744466732
color yellow, pair_06
distance pair_07, 1PT4 and resi 3 and name CA, 1PT4 and resi 27 and name CA  # target=16.299450930970227 current=14.20811923123301
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
