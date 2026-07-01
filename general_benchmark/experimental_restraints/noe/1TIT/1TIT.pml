# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 10.60511979023795

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 1+9+25+26+40+41+43+44+45+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 5+11+21+73
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 22 and name CA, 1TIT and resi 79 and name CA  # target=4.647636918307805 current=10.17886285059435
color yellow, pair_00
distance pair_01, 1TIT and resi 31 and name CA, 1TIT and resi 74 and name CA  # target=3.8636655574712133 current=9.238230835312491
color yellow, pair_01
distance pair_02, 1TIT and resi 18 and name CA, 1TIT and resi 60 and name CA  # target=4.507975919933174 current=9.243734286440267
color yellow, pair_02
distance pair_03, 1TIT and resi 17 and name CA, 1TIT and resi 61 and name CA  # target=4.541917735763398 current=9.122688109362667
color yellow, pair_03
distance pair_04, 1TIT and resi 10 and name CA, 1TIT and resi 82 and name CA  # target=4.33579809717985 current=8.883593341204408
color yellow, pair_04
distance pair_05, 1TIT and resi 7 and name CA, 1TIT and resi 79 and name CA  # target=4.647636918307805 current=9.08594928778597
color yellow, pair_05
distance pair_06, 1TIT and resi 1 and name CA, 1TIT and resi 75 and name CA  # target=4.368633443260828 current=8.732652179009985
color yellow, pair_06
distance pair_07, 1TIT and resi 15 and name CA, 1TIT and resi 61 and name CA  # target=4.33579809717985 current=8.628753959542241
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
