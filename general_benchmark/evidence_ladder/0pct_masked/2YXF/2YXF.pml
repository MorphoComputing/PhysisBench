# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3988454808483967

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 1+2+3+15+16+17+18+19+20+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 2+19+72+75+219+231
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 60 and name CA, 2YXF and resi 73 and name CA  # target=27.499999999692427 current=38.269704799406625
color yellow, pair_00
distance pair_01, 2YXF and resi 59 and name CA, 2YXF and resi 76 and name CA  # target=27.499999999486533 current=38.15940949619972
color yellow, pair_01
distance pair_02, 2YXF and resi 1 and name CA, 2YXF and resi 76 and name CA  # target=27.499999999244203 current=37.88390446354062
color yellow, pair_02
distance pair_03, 2YXF and resi 19 and name CA, 2YXF and resi 85 and name CA  # target=27.499999999059295 current=37.864459841789134
color yellow, pair_03
distance pair_04, 2YXF and resi 57 and name CA, 2YXF and resi 75 and name CA  # target=27.499999999402146 current=37.84570033208041
color yellow, pair_04
distance pair_05, 2YXF and resi 1 and name CA, 2YXF and resi 72 and name CA  # target=27.499999999409702 current=37.841390979682735
color yellow, pair_05
distance pair_06, 2YXF and resi 16 and name CA, 2YXF and resi 86 and name CA  # target=27.499999999611596 current=37.81865861318958
color yellow, pair_06
distance pair_07, 2YXF and resi 17 and name CA, 2YXF and resi 85 and name CA  # target=27.499999999115747 current=37.791848526078525
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
