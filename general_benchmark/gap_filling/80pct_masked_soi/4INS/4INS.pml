# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.019123607102214

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 20+23+47+54+55+64+68+70+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 40+47+61+71+143
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 46 and name CA, 4INS and resi 74 and name CA  # target=18.781700353268867 current=5.035834177859531
color yellow, pair_00
distance pair_01, 4INS and resi 47 and name CA, 4INS and resi 70 and name CA  # target=27.498149063527006 current=15.070740960687075
color yellow, pair_01
distance pair_02, 4INS and resi 47 and name CA, 4INS and resi 71 and name CA  # target=26.83599176743201 current=15.015348848748184
color yellow, pair_02
distance pair_03, 4INS and resi 60 and name CA, 4INS and resi 70 and name CA  # target=13.927119314635966 current=3.4788621274414613
color yellow, pair_03
distance pair_04, 4INS and resi 46 and name CA, 4INS and resi 68 and name CA  # target=27.29455361270812 current=17.591657747597882
color yellow, pair_04
distance pair_05, 4INS and resi 65 and name CA, 4INS and resi 73 and name CA  # target=15.29231095785695 current=5.819938554251514
color yellow, pair_05
distance pair_06, 4INS and resi 74 and name CA, 4INS and resi 87 and name CA  # target=19.09454817692403 current=10.059660416285988
color yellow, pair_06
distance pair_07, 4INS and resi 6 and name CA, 4INS and resi 47 and name CA  # target=12.345073689822652 current=21.235925707231242
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
