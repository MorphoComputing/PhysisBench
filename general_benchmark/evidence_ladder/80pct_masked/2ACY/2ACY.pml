# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.85245345324022

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 1+2+4+13+15+90+91+92+93+94
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2ACY and resi 46+55+77+84+88+94
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2ACY and resi 73 and name CA, 2ACY and resi 92 and name CA  # target=26.566992343019546 current=12.010600325561668
color yellow, pair_00
distance pair_01, 2ACY and resi 66 and name CA, 2ACY and resi 91 and name CA  # target=26.468422085809955 current=12.142608400788957
color yellow, pair_01
distance pair_02, 2ACY and resi 77 and name CA, 2ACY and resi 90 and name CA  # target=22.01106716635099 current=7.722805103878345
color yellow, pair_02
distance pair_03, 2ACY and resi 23 and name CA, 2ACY and resi 80 and name CA  # target=22.202290597891015 current=9.022366887443553
color yellow, pair_03
distance pair_04, 2ACY and resi 76 and name CA, 2ACY and resi 93 and name CA  # target=21.8886339416581 current=8.720307104737968
color yellow, pair_04
distance pair_05, 2ACY and resi 80 and name CA, 2ACY and resi 94 and name CA  # target=19.217264661751912 current=6.366799719569192
color yellow, pair_05
distance pair_06, 2ACY and resi 77 and name CA, 2ACY and resi 89 and name CA  # target=22.705859129473357 current=10.495410097125935
color yellow, pair_06
distance pair_07, 2ACY and resi 67 and name CA, 2ACY and resi 88 and name CA  # target=25.673313928437242 current=13.647727009748053
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
