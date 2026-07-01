# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 10.276389274710288

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 11+13+15+16+45+51+52+53+54+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 6+10+24+29+47
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 20 and name CA, 1TIT and resi 81 and name CA  # target=4.682015823900446 current=12.165304496832317
color yellow, pair_00
distance pair_01, 1TIT and resi 70 and name CA, 1TIT and resi 81 and name CA  # target=4.13496406254608 current=10.903548636801652
color yellow, pair_01
distance pair_02, 1TIT and resi 20 and name CA, 1TIT and resi 33 and name CA  # target=5.034494650555564 current=11.494768167524676
color yellow, pair_02
distance pair_03, 1TIT and resi 46 and name CA, 1TIT and resi 59 and name CA  # target=4.47460509597741 current=10.906687226973965
color yellow, pair_03
distance pair_04, 1TIT and resi 7 and name CA, 1TIT and resi 70 and name CA  # target=4.541917735763398 current=10.11158422165537
color yellow, pair_04
distance pair_05, 1TIT and resi 3 and name CA, 1TIT and resi 24 and name CA  # target=3.8636655574712133 current=9.266911505423344
color yellow, pair_05
distance pair_06, 1TIT and resi 68 and name CA, 1TIT and resi 83 and name CA  # target=4.33579809717985 current=9.679100639784519
color yellow, pair_06
distance pair_07, 1TIT and resi 14 and name CA, 1TIT and resi 85 and name CA  # target=4.507975919933174 current=9.769302560332333
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
