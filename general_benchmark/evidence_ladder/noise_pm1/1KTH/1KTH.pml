# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4813783546373274

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 8+14+15+16+31+43+44+46+49+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1KTH and resi 16
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1KTH and resi 14 and name CA, 1KTH and resi 56 and name CA  # target=27.47109539037175 current=32.66194015807046
color yellow, pair_00
distance pair_01, 1KTH and resi 13 and name CA, 1KTH and resi 56 and name CA  # target=27.420359877657667 current=31.79919773290507
color yellow, pair_01
distance pair_02, 1KTH and resi 15 and name CA, 1KTH and resi 56 and name CA  # target=27.45025499450519 current=31.14198653798384
color yellow, pair_02
distance pair_03, 1KTH and resi 29 and name CA, 1KTH and resi 41 and name CA  # target=16.994489699931673 current=13.572887941381175
color yellow, pair_03
distance pair_04, 1KTH and resi 20 and name CA, 1KTH and resi 43 and name CA  # target=8.465248901363687 current=5.322514170878685
color yellow, pair_04
distance pair_05, 1KTH and resi 9 and name CA, 1KTH and resi 31 and name CA  # target=9.053681972221495 current=12.015555725358743
color yellow, pair_05
distance pair_06, 1KTH and resi 28 and name CA, 1KTH and resi 36 and name CA  # target=19.92031001699412 current=22.5495064924807
color yellow, pair_06
distance pair_07, 1KTH and resi 21 and name CA, 1KTH and resi 51 and name CA  # target=6.167562613859482 current=8.7742612977709
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
