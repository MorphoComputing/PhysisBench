# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.7236561720454717

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 8+11+14+15+16+17+19+20+28+46
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 5+11+18
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 28 and name CA, 2HIU and resi 45 and name CA  # target=14.022517134642362 current=7.166203813702979
color yellow, pair_00
distance pair_01, 2HIU and resi 17 and name CA, 2HIU and resi 28 and name CA  # target=16.158031197728622 current=10.01409554157454
color yellow, pair_01
distance pair_02, 2HIU and resi 16 and name CA, 2HIU and resi 40 and name CA  # target=10.659237866524693 current=15.53463170616674
color yellow, pair_02
distance pair_03, 2HIU and resi 27 and name CA, 2HIU and resi 46 and name CA  # target=14.480914500066385 current=9.641162933128992
color yellow, pair_03
distance pair_04, 2HIU and resi 11 and name CA, 2HIU and resi 40 and name CA  # target=17.20971450791394 current=21.94881369838918
color yellow, pair_04
distance pair_05, 2HIU and resi 11 and name CA, 2HIU and resi 36 and name CA  # target=9.447724305261525 current=12.938419579216188
color yellow, pair_05
distance pair_06, 2HIU and resi 12 and name CA, 2HIU and resi 20 and name CA  # target=9.66827838459617 current=6.3410298889610885
color yellow, pair_06
distance pair_07, 2HIU and resi 19 and name CA, 2HIU and resi 43 and name CA  # target=7.085202430136108 current=10.33562636059859
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
