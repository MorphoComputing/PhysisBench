# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.3956147383162065

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+6+7+8+9+11+19+21+23+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 5WOW and resi 25+27+36+315
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 5WOW and resi 9 and name CA, 5WOW and resi 19 and name CA  # target=20.628552667983403 current=12.399120275378165
color yellow, pair_00
distance pair_01, 5WOW and resi 19 and name CA, 5WOW and resi 28 and name CA  # target=13.732133908352667 current=5.56526222343371
color yellow, pair_01
distance pair_02, 5WOW and resi 1 and name CA, 5WOW and resi 34 and name CA  # target=17.74229421321015 current=9.905601759363082
color yellow, pair_02
distance pair_03, 5WOW and resi 19 and name CA, 5WOW and resi 29 and name CA  # target=12.514026646232725 current=4.969582752300913
color yellow, pair_03
distance pair_04, 5WOW and resi 22 and name CA, 5WOW and resi 34 and name CA  # target=9.351934524724156 current=16.594011783103177
color yellow, pair_04
distance pair_05, 5WOW and resi 7 and name CA, 5WOW and resi 20 and name CA  # target=13.627797432014802 current=6.457442730620238
color yellow, pair_05
distance pair_06, 5WOW and resi 11 and name CA, 5WOW and resi 19 and name CA  # target=20.022673075180524 current=12.962100072692461
color yellow, pair_06
distance pair_07, 5WOW and resi 2 and name CA, 5WOW and resi 14 and name CA  # target=19.31975398435583 current=12.477539518272888
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
