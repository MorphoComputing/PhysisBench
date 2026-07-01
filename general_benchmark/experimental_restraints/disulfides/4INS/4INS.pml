# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 10.271939386971344

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 47+48+50+51+54+67+74+87+93+94
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4INS and resi 19 and name CA, 4INS and resi 37 and name CA  # target=5.526827568351721 current=3.310984912090937
color yellow, pair_00
distance pair_01, 4INS and resi 6 and name CA, 4INS and resi 25 and name CA  # target=5.526827568351721 current=3.479604189589449
color yellow, pair_01
distance pair_02, 4INS and resi 66 and name CA, 4INS and resi 84 and name CA  # target=5.526827568351721 current=6.026355168721613
color yellow, pair_02
distance pair_03, 4INS and resi 53 and name CA, 4INS and resi 72 and name CA  # target=5.526827568351721 current=5.614312531638245
color yellow, pair_03

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
