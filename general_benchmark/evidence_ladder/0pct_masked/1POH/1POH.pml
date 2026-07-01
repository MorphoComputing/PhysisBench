# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.04189980145191646

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 1+9+10+11+16+66+67+68+69+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1POH and resi 10 and name CA, 1POH and resi 67 and name CA  # target=27.499998509983207 current=33.72768182713883
color yellow, pair_00
distance pair_01, 1POH and resi 11 and name CA, 1POH and resi 67 and name CA  # target=27.499993107996108 current=32.897432142719516
color yellow, pair_01
distance pair_02, 1POH and resi 10 and name CA, 1POH and resi 66 and name CA  # target=27.499977098088348 current=32.21900856737337
color yellow, pair_02
distance pair_03, 1POH and resi 11 and name CA, 1POH and resi 66 and name CA  # target=27.499840779332562 current=31.150412926326375
color yellow, pair_03
distance pair_04, 1POH and resi 56 and name CA, 1POH and resi 67 and name CA  # target=27.499811997947187 current=31.056064481917744
color yellow, pair_04
distance pair_05, 1POH and resi 57 and name CA, 1POH and resi 67 and name CA  # target=27.49969823461757 current=30.77933592485753
color yellow, pair_05
distance pair_06, 1POH and resi 10 and name CA, 1POH and resi 68 and name CA  # target=27.49964360802977 current=30.680354281010082
color yellow, pair_06
distance pair_07, 1POH and resi 10 and name CA, 1POH and resi 29 and name CA  # target=27.49938163327631 current=30.386353200590115
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
