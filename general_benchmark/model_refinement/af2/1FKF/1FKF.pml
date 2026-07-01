# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.639754826410905

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 10+12+18+83+84+85+87+88+91+92
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 3+4+55+60
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 53 and name CA, 1FKF and resi 87 and name CA  # target=17.84378281167479 current=11.317478373137755
color yellow, pair_00
distance pair_01, 1FKF and resi 10 and name CA, 1FKF and resi 92 and name CA  # target=27.49641720944834 current=33.950352782536655
color yellow, pair_01
distance pair_02, 1FKF and resi 10 and name CA, 1FKF and resi 91 and name CA  # target=27.49317358471362 current=33.771642033744456
color yellow, pair_02
distance pair_03, 1FKF and resi 12 and name CA, 1FKF and resi 91 and name CA  # target=27.496782642272734 current=33.51300110799046
color yellow, pair_03
distance pair_04, 1FKF and resi 11 and name CA, 1FKF and resi 91 and name CA  # target=27.490459035094737 current=33.428661919206846
color yellow, pair_04
distance pair_05, 1FKF and resi 11 and name CA, 1FKF and resi 92 and name CA  # target=27.493629197243326 current=33.31929163951137
color yellow, pair_05
distance pair_06, 1FKF and resi 12 and name CA, 1FKF and resi 92 and name CA  # target=27.497633743321447 current=33.02758514590822
color yellow, pair_06
distance pair_07, 1FKF and resi 10 and name CA, 1FKF and resi 84 and name CA  # target=27.497755377566712 current=33.01794607030061
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
