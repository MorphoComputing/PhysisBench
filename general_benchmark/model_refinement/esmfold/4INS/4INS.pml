# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 15.08641083393521

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 20+21+23+45+46+47+67+68+69+94
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 868+1320
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 6 and name CA, 4INS and resi 25 and name CA  # target=26.68328478578213 current=9.146798859146363
color yellow, pair_00
distance pair_01, 4INS and resi 53 and name CA, 4INS and resi 72 and name CA  # target=24.79413747106657 current=7.655563768339858
color yellow, pair_01
distance pair_02, 4INS and resi 25 and name CA, 4INS and resi 54 and name CA  # target=8.201428184294686 current=25.0921503787737
color yellow, pair_02
distance pair_03, 4INS and resi 29 and name CA, 4INS and resi 72 and name CA  # target=19.587663717373285 current=3.0822672537636535
color yellow, pair_03
distance pair_04, 4INS and resi 24 and name CA, 4INS and resi 72 and name CA  # target=21.04962599773409 current=4.5970376280247205
color yellow, pair_04
distance pair_05, 4INS and resi 26 and name CA, 4INS and resi 72 and name CA  # target=24.455137025396127 current=8.190248224009833
color yellow, pair_05
distance pair_06, 4INS and resi 49 and name CA, 4INS and resi 72 and name CA  # target=24.202099392261143 current=7.990407020557671
color yellow, pair_06
distance pair_07, 4INS and resi 25 and name CA, 4INS and resi 53 and name CA  # target=5.216304555801433 current=21.154519398704032
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
