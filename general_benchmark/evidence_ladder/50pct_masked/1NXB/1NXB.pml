# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7112719261275695

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 17+18+19+20+30+31+32+33+34+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NXB and resi 19 and name CA, 1NXB and resi 32 and name CA  # target=27.499999880636196 current=34.013616324917656
color yellow, pair_00
distance pair_01, 1NXB and resi 18 and name CA, 1NXB and resi 30 and name CA  # target=27.499998412258662 current=32.57193903067399
color yellow, pair_01
distance pair_02, 1NXB and resi 21 and name CA, 1NXB and resi 31 and name CA  # target=27.499997687010826 current=32.0947786210866
color yellow, pair_02
distance pair_03, 1NXB and resi 32 and name CA, 1NXB and resi 56 and name CA  # target=27.49987931770681 current=31.364411904286865
color yellow, pair_03
distance pair_04, 1NXB and resi 31 and name CA, 1NXB and resi 55 and name CA  # target=27.499937139270507 current=31.150427822831627
color yellow, pair_04
distance pair_05, 1NXB and resi 18 and name CA, 1NXB and resi 29 and name CA  # target=27.499905847629375 current=30.787167794554556
color yellow, pair_05
distance pair_06, 1NXB and resi 17 and name CA, 1NXB and resi 31 and name CA  # target=27.499995083214717 current=30.761311855338942
color yellow, pair_06
distance pair_07, 1NXB and resi 19 and name CA, 1NXB and resi 34 and name CA  # target=27.499835718320824 current=30.17518637216723
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
