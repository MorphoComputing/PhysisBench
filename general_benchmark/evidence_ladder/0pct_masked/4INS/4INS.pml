# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.6421772923758295

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 51+55+56+58+61+71+72+73+74+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 47+80+345+1550
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 66 and name CA, 4INS and resi 75 and name CA  # target=16.004032764990406 current=4.146655765180484
color yellow, pair_00
distance pair_01, 4INS and resi 65 and name CA, 4INS and resi 75 and name CA  # target=14.90632926585491 current=3.6906534944979077
color yellow, pair_01
distance pair_02, 4INS and resi 66 and name CA, 4INS and resi 74 and name CA  # target=16.53805937733716 current=6.097281137177035
color yellow, pair_02
distance pair_03, 4INS and resi 64 and name CA, 4INS and resi 75 and name CA  # target=16.86309496078161 current=6.588093813527836
color yellow, pair_03
distance pair_04, 4INS and resi 74 and name CA, 4INS and resi 89 and name CA  # target=14.16318190774079 current=3.9513448911673437
color yellow, pair_04
distance pair_05, 4INS and resi 75 and name CA, 4INS and resi 87 and name CA  # target=18.773354073092207 current=8.601727138738744
color yellow, pair_05
distance pair_06, 4INS and resi 75 and name CA, 4INS and resi 89 and name CA  # target=14.478945472040733 current=4.425909839832009
color yellow, pair_06
distance pair_07, 4INS and resi 74 and name CA, 4INS and resi 87 and name CA  # target=19.09454817692403 current=9.284468025546142
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
