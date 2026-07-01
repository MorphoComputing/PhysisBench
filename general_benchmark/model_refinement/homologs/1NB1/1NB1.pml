# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7850954448472133

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+6+10+12+13+14+23+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 13 and name CA, 1NB1 and resi 24 and name CA  # target=9.544443706885874 current=8.602121010479777
color yellow, pair_00
distance pair_01, 1NB1 and resi 3 and name CA, 1NB1 and resi 20 and name CA  # target=4.781959614572202 current=3.90187362654221
color yellow, pair_01
distance pair_02, 1NB1 and resi 1 and name CA, 1NB1 and resi 23 and name CA  # target=12.131980335063844 current=11.255137678430016
color yellow, pair_02
distance pair_03, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=5.662523885447022 current=4.880815363955614
color yellow, pair_03
distance pair_04, 1NB1 and resi 1 and name CA, 1NB1 and resi 24 and name CA  # target=15.275669572227258 current=14.56558450192842
color yellow, pair_04
distance pair_05, 1NB1 and resi 5 and name CA, 1NB1 and resi 19 and name CA  # target=5.386069570293558 current=4.686329987472512
color yellow, pair_05
distance pair_06, 1NB1 and resi 1 and name CA, 1NB1 and resi 22 and name CA  # target=9.733013310492288 current=9.045579843297103
color yellow, pair_06
distance pair_07, 1NB1 and resi 9 and name CA, 1NB1 and resi 24 and name CA  # target=14.329606234870457 current=13.653417163802391
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
