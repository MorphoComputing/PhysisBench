# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.421959455874209

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 10+11+12+13+31+33+84+87+88+91
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 32+84+104+302+636+1482
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 15 and name CA, 1FKF and resi 77 and name CA  # target=16.86030033801087 current=27.117655776846618
color yellow, pair_00
distance pair_01, 1FKF and resi 33 and name CA, 1FKF and resi 99 and name CA  # target=19.406656111128953 current=9.168168916156015
color yellow, pair_01
distance pair_02, 1FKF and resi 31 and name CA, 1FKF and resi 99 and name CA  # target=17.701656923265293 current=7.7384244354579685
color yellow, pair_02
distance pair_03, 1FKF and resi 83 and name CA, 1FKF and resi 96 and name CA  # target=20.903131145991285 current=11.496766632478955
color yellow, pair_03
distance pair_04, 1FKF and resi 55 and name CA, 1FKF and resi 88 and name CA  # target=19.289667398457976 current=10.067260156067483
color yellow, pair_04
distance pair_05, 1FKF and resi 27 and name CA, 1FKF and resi 99 and name CA  # target=14.779511612194817 current=5.591594177366835
color yellow, pair_05
distance pair_06, 1FKF and resi 27 and name CA, 1FKF and resi 103 and name CA  # target=21.486323682397042 current=12.69775333180158
color yellow, pair_06
distance pair_07, 1FKF and resi 34 and name CA, 1FKF and resi 42 and name CA  # target=21.982326480269563 current=13.406809097877959
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
