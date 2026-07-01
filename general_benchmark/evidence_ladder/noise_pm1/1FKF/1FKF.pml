# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.9117384817414653

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 10+11+12+13+83+84+85+87+88+92
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 18+45+84+92+127
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 55 and name CA, 1FKF and resi 88 and name CA  # target=18.33506502535742 current=10.777739987882725
color yellow, pair_00
distance pair_01, 1FKF and resi 55 and name CA, 1FKF and resi 87 and name CA  # target=16.131079937999814 current=9.117859926587913
color yellow, pair_01
distance pair_02, 1FKF and resi 76 and name CA, 1FKF and resi 84 and name CA  # target=15.112836856763282 current=8.934521273872518
color yellow, pair_02
distance pair_03, 1FKF and resi 54 and name CA, 1FKF and resi 87 and name CA  # target=17.119855068087087 current=11.13523011795568
color yellow, pair_03
distance pair_04, 1FKF and resi 3 and name CA, 1FKF and resi 12 and name CA  # target=17.369749417426455 current=11.621399924559022
color yellow, pair_04
distance pair_05, 1FKF and resi 2 and name CA, 1FKF and resi 12 and name CA  # target=18.976010315909665 current=13.382796680708346
color yellow, pair_05
distance pair_06, 1FKF and resi 75 and name CA, 1FKF and resi 87 and name CA  # target=19.528823991003883 current=14.080407456901225
color yellow, pair_06
distance pair_07, 1FKF and resi 18 and name CA, 1FKF and resi 31 and name CA  # target=27.465814941419563 current=32.86835792017594
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
