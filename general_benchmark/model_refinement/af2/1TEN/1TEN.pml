# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6409617299992445

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 6+26+27+39+40+41+42+59+60+77
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 8+51+64
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 27 and name CA, 1TEN and resi 64 and name CA  # target=27.49834425298756 current=37.19543738230704
color yellow, pair_00
distance pair_01, 1TEN and resi 64 and name CA, 1TEN and resi 76 and name CA  # target=27.498393299481595 current=37.069322277701076
color yellow, pair_01
distance pair_02, 1TEN and resi 27 and name CA, 1TEN and resi 63 and name CA  # target=27.4976926046254 current=36.71219564607643
color yellow, pair_02
distance pair_03, 1TEN and resi 64 and name CA, 1TEN and resi 77 and name CA  # target=27.49769132315045 current=36.486362942539486
color yellow, pair_03
distance pair_04, 1TEN and resi 14 and name CA, 1TEN and resi 77 and name CA  # target=27.497474038263885 current=36.36682252684956
color yellow, pair_04
distance pair_05, 1TEN and resi 63 and name CA, 1TEN and resi 76 and name CA  # target=27.497504988825554 current=36.35496377768793
color yellow, pair_05
distance pair_06, 1TEN and resi 14 and name CA, 1TEN and resi 76 and name CA  # target=27.497179993602465 current=36.220978368300585
color yellow, pair_06
distance pair_07, 1TEN and resi 26 and name CA, 1TEN and resi 64 and name CA  # target=27.49673956077946 current=36.138742359447754
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
