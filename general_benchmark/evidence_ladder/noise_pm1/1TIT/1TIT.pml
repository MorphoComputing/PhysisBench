# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5213166374963161

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 4+14+15+26+44+55+68+74+86+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 8+13+25+48
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 28 and name CA, 1TIT and resi 87 and name CA  # target=27.499050177424955 current=37.660529798351995
color yellow, pair_00
distance pair_01, 1TIT and resi 26 and name CA, 1TIT and resi 87 and name CA  # target=27.499193830780506 current=37.32383837314434
color yellow, pair_01
distance pair_02, 1TIT and resi 27 and name CA, 1TIT and resi 87 and name CA  # target=27.4991670359254 current=37.2269492741036
color yellow, pair_02
distance pair_03, 1TIT and resi 1 and name CA, 1TIT and resi 87 and name CA  # target=27.497843520275687 current=37.009523860032516
color yellow, pair_03
distance pair_04, 1TIT and resi 25 and name CA, 1TIT and resi 87 and name CA  # target=27.497919521232383 current=36.39393344159391
color yellow, pair_04
distance pair_05, 1TIT and resi 28 and name CA, 1TIT and resi 86 and name CA  # target=27.492957474587953 current=35.48148289829641
color yellow, pair_05
distance pair_06, 1TIT and resi 76 and name CA, 1TIT and resi 87 and name CA  # target=27.48352240243639 current=34.95473795008351
color yellow, pair_06
distance pair_07, 1TIT and resi 27 and name CA, 1TIT and resi 86 and name CA  # target=27.484931831976546 current=34.898955958882866
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
