# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5746729798799701

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 1+3+4+7+9+44+49+82+86+96
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HRC and resi 13+31
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HRC and resi 1 and name CA, 1HRC and resi 49 and name CA  # target=27.463067538796455 current=32.44008534222998
color yellow, pair_00
distance pair_01, 1HRC and resi 44 and name CA, 1HRC and resi 86 and name CA  # target=27.474160789616192 current=31.864423024701594
color yellow, pair_01
distance pair_02, 1HRC and resi 3 and name CA, 1HRC and resi 49 and name CA  # target=27.480748988475302 current=31.7759111790492
color yellow, pair_02
distance pair_03, 1HRC and resi 18 and name CA, 1HRC and resi 73 and name CA  # target=18.49041239610817 current=22.608518279854238
color yellow, pair_03
distance pair_04, 1HRC and resi 44 and name CA, 1HRC and resi 88 and name CA  # target=27.430015987871386 current=31.446851292158073
color yellow, pair_04
distance pair_05, 1HRC and resi 4 and name CA, 1HRC and resi 49 and name CA  # target=27.480014901094247 current=31.443062352589397
color yellow, pair_05
distance pair_06, 1HRC and resi 44 and name CA, 1HRC and resi 87 and name CA  # target=27.47223090163114 current=31.382588651921267
color yellow, pair_06
distance pair_07, 1HRC and resi 22 and name CA, 1HRC and resi 86 and name CA  # target=27.17092797252578 current=30.900788453955425
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
