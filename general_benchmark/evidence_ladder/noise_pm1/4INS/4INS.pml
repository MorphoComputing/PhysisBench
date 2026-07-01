# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.352360651353211

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 51+55+56+60+61+71+72+73+74+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 47+80+419+1484
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 45 and name CA, 4INS and resi 75 and name CA  # target=19.58385402901307 current=8.335537674155146
color yellow, pair_00
distance pair_01, 4INS and resi 66 and name CA, 4INS and resi 75 and name CA  # target=15.927920685437872 current=4.8897870351382045
color yellow, pair_01
distance pair_02, 4INS and resi 45 and name CA, 4INS and resi 74 and name CA  # target=17.636606520129085 current=6.892280138770756
color yellow, pair_02
distance pair_03, 4INS and resi 74 and name CA, 4INS and resi 87 and name CA  # target=19.277909392064128 current=8.552700337009854
color yellow, pair_03
distance pair_04, 4INS and resi 66 and name CA, 4INS and resi 74 and name CA  # target=15.577241566684261 current=4.943865841085359
color yellow, pair_04
distance pair_05, 4INS and resi 47 and name CA, 4INS and resi 74 and name CA  # target=22.673699887375868 current=12.146090250831989
color yellow, pair_05
distance pair_06, 4INS and resi 74 and name CA, 4INS and resi 90 and name CA  # target=14.374547282999023 current=4.2134691184538
color yellow, pair_06
distance pair_07, 4INS and resi 74 and name CA, 4INS and resi 84 and name CA  # target=17.85507348095108 current=7.79329934606999
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
