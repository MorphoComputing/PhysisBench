# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.013282856763798

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 4+8+11+15+16+20+21+22+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 10+17+23+24+58+128
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 7 and name CA, 1VII and resi 28 and name CA  # target=20.609746712590145 current=13.357033185796471
color yellow, pair_00
distance pair_01, 1VII and resi 14 and name CA, 1VII and resi 27 and name CA  # target=20.484638023889595 current=13.869480441403134
color yellow, pair_01
distance pair_02, 1VII and resi 25 and name CA, 1VII and resi 33 and name CA  # target=16.610759405431864 current=10.201072815047292
color yellow, pair_02
distance pair_03, 1VII and resi 17 and name CA, 1VII and resi 25 and name CA  # target=13.751177123097898 current=7.46399059334955
color yellow, pair_03
distance pair_04, 1VII and resi 2 and name CA, 1VII and resi 13 and name CA  # target=16.371055284948305 current=10.171468838817974
color yellow, pair_04
distance pair_05, 1VII and resi 9 and name CA, 1VII and resi 31 and name CA  # target=15.421930518956287 current=9.448085038082036
color yellow, pair_05
distance pair_06, 1VII and resi 13 and name CA, 1VII and resi 30 and name CA  # target=9.656677330903982 current=15.346047175805003
color yellow, pair_06
distance pair_07, 1VII and resi 10 and name CA, 1VII and resi 19 and name CA  # target=17.954994637768817 current=12.40219387637391
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
